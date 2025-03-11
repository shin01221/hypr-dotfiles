import bpy
from bpy.types import Menu, Operator

class Fluid_Modifier(Operator):
    bl_idname = "fluid.modifier"
    bl_label = "Fluid"

    def execute(self, context):
        bpy.ops.object.modifier_add(type='FLUID')
        return {'FINISHED'}
    
class SoftBody_Modifier(Operator):
    bl_idname = "softbody.modifier"
    bl_label = "Soft Body"

    def execute(self, context):
        bpy.ops.object.modifier_add(type='SOFT_BODY')
        return {'FINISHED'}
    
class RigidBody_Add(Operator):
    bl_idname = "rigidbody.add"
    bl_label = "Rigid Body"

    def execute(self, context):
        bpy.ops.rigidbody.object_add()
        return {'FINISHED'}
    
class Cloth_Modifier(Operator):
    bl_idname = "cloth.modifier"
    bl_label = "Cloth"

    def execute(self, context):
        bpy.ops.object.modifier_add(type='CLOTH')
        return {'FINISHED'}
    
class Collision_Modifier(Operator):
    bl_idname = "collision.modifier"
    bl_label = "Collision"

    def execute(self, context):
        bpy.ops.object.modifier_add(type='COLLISION')
        return {'FINISHED'}

class DynamicPaint_Modifier(Operator):
    bl_idname = "dynamicpaint.modifier"
    bl_label = "Dynamic Paint"

    def execute(self, context):
        bpy.ops.object.modifier_add(type='DYNAMIC_PAINT')
        return {'FINISHED'}
    
class RigidBodyCons_Add(Operator):
    bl_idname = "rigidbodycons.add"
    bl_label = "Rigid Body Constraint"

    def execute(self, context):
        bpy.ops.rigidbody.constraint_add()
        return {'FINISHED'}
    
class ForceField_Add(Operator):
    bl_idname = "forcefield.add"
    bl_label = "Force Field"

    def execute(self, context):
        bpy.ops.object.forcefield_toggle()
        return {'FINISHED'}


class VIEW3D_MT_PIE_Physicspie(Menu):
    bl_label = "Physics"

    @classmethod
    def poll(cls, context):
        obj = context.active_object
        return obj and obj.type == "MESH"

    def draw(self, context):
        layout = self.layout
        
        pie = layout.menu_pie()
        pie.operator("Fluid.modifier", icon="MOD_FLUIDSIM")
        pie.operator("SoftBody.modifier", icon="MOD_SOFT")
        pie.operator("RigidBody.add", icon="RIGID_BODY")
        pie.operator("RigidBodyCons.add", icon="RIGID_BODY_CONSTRAINT")
        pie.operator("ForceField.add", icon="FORCE_FORCE")
        pie.operator("Cloth.modifier", icon="MOD_CLOTH")
        pie.operator("Collision.modifier", icon="MOD_PHYSICS")
        pie.operator("DynamicPaint.modifier", icon="MOD_DYNAMICPAINT")
        
        


global_addon_keymaps = []

classes = (
    VIEW3D_MT_PIE_Physicspie,
    Fluid_Modifier,
    SoftBody_Modifier,
    RigidBody_Add,
    Cloth_Modifier,
    Collision_Modifier,
    DynamicPaint_Modifier,
    RigidBodyCons_Add,
    ForceField_Add,
)



def register():
    for cls in classes:
        bpy.utils.register_class(cls)
    #keymap
    window_manager = bpy.context.window_manager
    if window_manager.keyconfigs.addon:
        keymap = window_manager.keyconfigs.addon.keymaps.new(name='3D View', space_type='VIEW_3D')
        keymap_item = keymap.keymap_items.new('wm.call_menu_pie', 'R', 'PRESS', shift=True, ctrl=True)
        keymap_item.properties.name = "VIEW3D_MT_PIE_Physicspie"
        global_addon_keymaps.append((keymap, keymap_item))
    
        
def unregister():
    for cls in reversed(classes):
        bpy.utils.unregister_class(cls)
    #keymap
    window_manager = bpy.context.window_manager
    if window_manager and window_manager.keyconfigs and window_manager.keyconfigs.addon:
        for keymap, keymap_item in global_addon_keymaps:
            keymap.keymap_items.remove(keymap_item)
    global_addon_keymaps.clear()
    
  
if __name__ == "__main__":
    register()

    bpy.ops.wm.call_menu_pie(name="VIEW3D_MT_PIE_Physicspie")