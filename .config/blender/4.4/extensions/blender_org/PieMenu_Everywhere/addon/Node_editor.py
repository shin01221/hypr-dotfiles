
import bpy
from bpy.types import Menu, Operator

class ShaderNodes_Editor(Operator):
    bl_idname = "shadernodes.editor"
    bl_label = "Shading Editor"

    def execute(self, context):
        bpy.context.area.ui_type = 'ShaderNodeTree'
        return {'FINISHED'}


class CompositorNode_Editor(Operator):
    bl_idname = "compositornode.editor"
    bl_label = "Compositor"

    def execute(self, context):
        bpy.context.area.ui_type = 'CompositorNodeTree'
        return {'FINISHED'}
    
    
class Geonodes_Editor(Operator):
    bl_idname = "geonodes.editor"
    bl_label = "Geometry Node Editor"

    def execute(self, context):
        bpy.context.area.ui_type = 'GeometryNodeTree'
        return {'FINISHED'}
    
class Texturenode_Editor(Operator):
    bl_idname = "texturenode.editor"
    bl_label = "Texture Node Editor"

    def execute(self, context):
        bpy.context.area.ui_type = 'TextureNodeTree'
        return {'FINISHED'}


class NODE_EDITOR_MT_NodeEditorpie(Menu):
    bl_label = "Node Editor pie"

    def draw(self, context):
        layout = self.layout

        pie = layout.menu_pie()
        pie.operator("ShaderNodes.editor", icon="NODE_MATERIAL")
        pie.operator("CompositorNode.editor", icon="NODE_COMPOSITING")
        pie.operator("Geonodes.editor", icon="GEOMETRY_NODES")
        pie.operator("Texturenode.editor", icon="NODE_TEXTURE")


global_addon_keymaps = []


classes = (
    NODE_EDITOR_MT_NodeEditorpie,
    ShaderNodes_Editor,
    CompositorNode_Editor,
    Geonodes_Editor,
    Texturenode_Editor,
)



def register():
    for cls in classes:
        bpy.utils.register_class(cls)
    #keymap
    window_manager = bpy.context.window_manager
    if window_manager.keyconfigs.addon:
        keymap = window_manager.keyconfigs.addon.keymaps.new(name='Node Editor', space_type='NODE_EDITOR')
        keymap_item = keymap.keymap_items.new('wm.call_menu_pie', 'T', 'PRESS', shift=True)
        keymap_item.properties.name = "NODE_EDITOR_MT_NodeEditorpie"
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

    bpy.ops.wm.call_menu_pie(name="NODE_EDITOR_MT_NodeEditorpie") 
    