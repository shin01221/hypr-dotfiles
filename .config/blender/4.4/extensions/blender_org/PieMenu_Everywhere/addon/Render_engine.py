import bpy
from bpy.types import Menu, Operator

    
class Cycles_Engine(Operator):
    bl_idname = "cycles.engine"
    bl_label = "Cycles"

    def execute(self, context):
        bpy.context.scene.render.engine = 'CYCLES'
        bpy.context.space_data.shading.type = 'RENDERED'
        return {'FINISHED'}
    
class Workbench_Engine(Operator):
    bl_idname = "workbench.engine"
    bl_label = "Workbench"

    def execute(self, context):
        bpy.context.scene.render.engine = 'BLENDER_WORKBENCH'
        bpy.context.space_data.shading.type = 'RENDERED'
        return {'FINISHED'}
    
class EeveeNext_Engine(Operator):
    bl_idname = "eeveenext.engine"
    bl_label = "EEVEE"

    def execute(self, context):
        bpy.context.scene.render.engine = 'BLENDER_EEVEE_NEXT'
        bpy.context.space_data.shading.type = 'RENDERED'
        return {'FINISHED'}



class VIEW3D_MT_PIE_RenderEnginepie(Menu):
    bl_label = "Render Engine"

    def draw(self, context):
        layout = self.layout
        
        pie = layout.menu_pie()
        pie.operator("CYCLES.engine", icon="MEMORY")
        pie.operator("WORKBENCH.engine", icon="MEMORY")
        pie.operator("EEVEENEXT.engine", icon="MEMORY")


global_addon_keymaps = []

classes = (
    VIEW3D_MT_PIE_RenderEnginepie,
    Cycles_Engine,
    Workbench_Engine,
    EeveeNext_Engine,
)



def register():
    for cls in classes:
        bpy.utils.register_class(cls)
    #keymap
    window_manager = bpy.context.window_manager
    if window_manager.keyconfigs.addon:
        keymap = window_manager.keyconfigs.addon.keymaps.new(name='3D View', space_type='VIEW_3D')
        keymap_item = keymap.keymap_items.new('wm.call_menu_pie', 'T', 'PRESS', shift=True)
        keymap_item.properties.name = "VIEW3D_MT_PIE_RenderEnginepie"
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

    bpy.ops.wm.call_menu_pie(name="VIEW3D_MT_PIE_RenderEnginepie")