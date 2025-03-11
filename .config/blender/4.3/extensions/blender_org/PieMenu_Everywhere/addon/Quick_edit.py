import bpy 
from bpy.types import Menu, Operator


class Remove_doubles(Operator):
    bl_idname = "remove.doubles"
    bl_label = "Merge By Distance"

    def execute(self, context):
        bpy.ops.mesh.remove_doubles()
        return {'FINISHED'}
    
class Normal_recalculate(Operator):
    bl_idname = "normals.recalculate"
    bl_label = "Recalculate Normals"

    def execute(self, context):
        bpy.ops.mesh.normals_make_consistent(inside=False)
        return {'FINISHED'}
    
class Grid_fill(Operator):
    bl_idname = "grid.fill"
    bl_label = "Grid Fill"

    def execute(self, context):
        bpy.ops.mesh.fill_grid(span=1)
        return {'FINISHED'}
    

class VIEW3D_MT_PIE_quickeditpie(Menu):
    bl_label = "Quick Edit"

    def draw(self, context):
        layout = self.layout
        
        pie = layout.menu_pie()
        pie.operator("Remove.doubles", icon="AUTOMERGE_ON")
        pie.operator("Normals.recalculate", icon="MOD_NORMALEDIT")
        pie.operator("grid.fill", icon="MESH_GRID")

global_addon_keymaps = []



classes = (
    VIEW3D_MT_PIE_quickeditpie,
    Remove_doubles,
    Normal_recalculate,
    Grid_fill,
)



def register():
    for cls in classes:
        bpy.utils.register_class(cls)
    #keymap
    window_manager = bpy.context.window_manager
    if window_manager.keyconfigs.addon:
        keymap = window_manager.keyconfigs.addon.keymaps.new(name='Mesh')
        keymap_item = keymap.keymap_items.new('wm.call_menu_pie', 'T', 'PRESS', shift=True)
        keymap_item.properties.name = "VIEW3D_MT_PIE_quickeditpie"
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

    bpy.ops.wm.call_menu_pie(name="VIEW3D_MT_PIE_quickeditpie")
    


