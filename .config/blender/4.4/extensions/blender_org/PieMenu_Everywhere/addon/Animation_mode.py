
import bpy
from bpy.types import Menu, Operator

class Timeline_Mode(Operator):
    bl_idname = "timeline.mode"
    bl_label = "Timeline"

    def execute(self, context):
        bpy.context.area.ui_type = 'TIMELINE'
        return {'FINISHED'}
    
    
class Dopesheet_Mode(Operator):
    bl_idname = "dopesheet.mode"
    bl_label = "Dopesheet"

    def execute(self, context):
        bpy.context.area.ui_type = 'DOPESHEET'
        return {'FINISHED'}


class Fcurves_Mode(Operator):
    bl_idname = "fcurve.mode"
    bl_label = "Graph Editor"

    def execute(self, context):
        bpy.context.area.ui_type = 'FCURVES'
        return {'FINISHED'}
    
class NLA_Mode(Operator):
    bl_idname = "nla.mode"
    bl_label = "Non Linear Animation"

    def execute(self, context):
        bpy.context.area.ui_type = 'NLA_EDITOR'
        return {'FINISHED'}


class ANIMATION_MT_PIE_NodeEditorpie(Menu):
    bl_label = "Animation window Pie"

    def draw(self, context):
        layout = self.layout

        pie = layout.menu_pie()
        pie.operator("Timeline.mode", icon="TIME")
        pie.operator("Dopesheet.mode",icon="ACTION")
        pie.operator("Fcurve.mode",icon="GRAPH")
        pie.operator("Nla.mode",icon="NLA")


global_addon_keymaps = []

classes = (
    ANIMATION_MT_PIE_NodeEditorpie,
    Timeline_Mode,
    Dopesheet_Mode,
    Fcurves_Mode,
    NLA_Mode,
)

def register():
    for cls in classes:
        bpy.utils.register_class(cls)
    #keymap
    window_manager = bpy.context.window_manager
    if window_manager.keyconfigs.addon:
        keymap = window_manager.keyconfigs.addon.keymaps.new(name='Animation')
        keymap_item = keymap.keymap_items.new('wm.call_menu_pie', 'T', 'PRESS', shift=True)
        keymap_item.properties.name = "ANIMATION_MT_PIE_NodeEditorpie"
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

    bpy.ops.wm.call_menu_pie(name="ANIMATION_MT_PIE_NodeEditorpie") 
    