import bpy 
import os 
from bpy.types import Menu, Operator
from . utils.Operators_custom import Apply_Modifier_Inorder,Reset_transform,Clear_Scene
    
class Apply_Modifiers(Operator):
    bl_idname = "modifiers.apply"
    bl_label = "Apply Modifiers"

    def execute(self, context):
        Apply_Modifier_Inorder()
        return {'FINISHED'}
    
class Reset_Transform(Operator):
    bl_idname = "transform.reset"
    bl_label = "Reset Transform"

    def execute(self, context):
        Reset_transform()
        return {'FINISHED'}
    
class clear_scene(Operator):
    bl_idname = "scene.clear"
    bl_label = "Clear Scene"

    def execute(self, context):
        Clear_Scene()
        return {'FINISHED'}

class VIEW3D_MT_PIE_Extraspie(Menu):
    bl_label = "Extras"

    def draw(self, context):
        layout = self.layout
        pcoll = preview_collections["main"]
        pie = layout.menu_pie()
        location_icon = pcoll["location_icon"]
        pie.operator("Modifiers.apply", icon="MODIFIER")
        pie.operator("Transform.reset", icon_value=location_icon.icon_id)
        pie.operator('Scene.clear',)


global_addon_keymaps = []
preview_collections = {}

classes = (
    VIEW3D_MT_PIE_Extraspie,
    Apply_Modifiers,
    Reset_Transform,
    clear_scene,
)



def register():
    import bpy.utils.previews
    pcoll = bpy.utils.previews.new()
    for cls in classes:
        bpy.utils.register_class(cls)
    #keymap
    window_manager = bpy.context.window_manager
    if window_manager.keyconfigs.addon:
        keymap = window_manager.keyconfigs.addon.keymaps.new(name='3D View', space_type='VIEW_3D')
        keymap_item = keymap.keymap_items.new('wm.call_menu_pie', 'R', 'PRESS', ctrl=True)
        keymap_item.properties.name = "VIEW3D_MT_PIE_Extraspie"
        global_addon_keymaps.append((keymap, keymap_item))
    
    my_icons_dir = os.path.join(os.path.dirname(__file__), "icons")
    pcoll.load("location_icon", os.path.join(my_icons_dir, "location.png"), 'IMAGE')

    preview_collections["main"] = pcoll
        
def unregister():
    for cls in reversed(classes):
        bpy.utils.unregister_class(cls)
    #keymap
    window_manager = bpy.context.window_manager
    if window_manager and window_manager.keyconfigs and window_manager.keyconfigs.addon:
        for keymap, keymap_item in global_addon_keymaps:
            keymap.keymap_items.remove(keymap_item)
    global_addon_keymaps.clear()
    
    for pcoll in preview_collections.values():
        bpy.utils.previews.remove(pcoll)
    preview_collections.clear()
    
    
if __name__ == "__main__":
    register()
    bpy.ops.wm.call_menu_pie(name="VIEW3D_MT_PIE_Extraspie")

    
