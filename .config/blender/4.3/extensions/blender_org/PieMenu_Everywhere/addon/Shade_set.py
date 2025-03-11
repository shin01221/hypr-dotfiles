
import bpy
from bpy.types import Menu, Operator

class Shadesmooth_Set(Operator):
    bl_idname = "shadesmooth.set"
    bl_label = "Shade Smooth"

    def execute(self, context):
        bpy.ops.object.shade_smooth()
        return {'FINISHED'}
    
class ShadeAutosmooth_Set(Operator):
    bl_idname = "shadeautosmooth.set"
    bl_label = "Shade Auto Smooth"

    def execute(self, context):
        bpy.ops.object.shade_auto_smooth()
        return {'FINISHED'}
    
class Shadeflat_Set(Operator):
    bl_idname = "shadeflat.set"
    bl_label = "Shade Flat"

    def execute(self, context):
        bpy.ops.object.shade_flat()
        return {'FINISHED'}
    
    
class Bevelsmooth_Set(Operator):
    bl_idname = "bevelsmooth.set"
    bl_label = "Add Bevel & Set Smooth"

    def execute(self, context):
        bpy.ops.object.modifier_add(type='BEVEL')
        bpy.context.object.modifiers["Bevel"].segments = 3
        bpy.ops.object.shade_smooth()
        return {'FINISHED'}
    
class OBJECT_MT_PIE_ShadeSmoothpie(Menu):
    bl_label = "Set Shading"
    
    @classmethod
    def poll(cls, context):
        obj = context.active_object
        return obj and obj.type == "MESH"

    def draw(self, context):
        layout = self.layout

        pie = layout.menu_pie()
        pie.operator("Shadesmooth.set", icon="NODE_MATERIAL")
        pie.operator("Shadeautosmooth.set", icon="SHADING_RENDERED")
        pie.operator("Shadeflat.set", icon="SHADING_SOLID")
        pie.operator("Bevelsmooth.set", icon="MATSHADERBALL")


global_addon_keymaps = []


classes = (
    OBJECT_MT_PIE_ShadeSmoothpie,
    Shadesmooth_Set,
    ShadeAutosmooth_Set,
    Shadeflat_Set,
    Bevelsmooth_Set,
)


def register():
    for cls in classes:
        bpy.utils.register_class(cls)
    #keymap
    window_manager = bpy.context.window_manager
    if window_manager.keyconfigs.addon:
        keymap = window_manager.keyconfigs.addon.keymaps.new(name='3D View', space_type = 'VIEW_3D')
        keymap_item = keymap.keymap_items.new('wm.call_menu_pie', 'T', 'PRESS', shift=True,ctrl=True)
        keymap_item.properties.name = "OBJECT_MT_PIE_ShadeSmoothpie"
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

    bpy.ops.wm.call_menu_pie(name="OBJECT_MT_PIE_ShadeSmoothpie") 
    