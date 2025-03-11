import bpy 

from bpy.types import Menu, Operator

###LINK
class Link_Obdata(Operator):
    bl_idname = "obdata.link"
    bl_label = "Link Object Data"

    def execute(self, context):
        bpy.ops.object.make_links_data(type='OBDATA')
        return {'FINISHED'}
    
class Link_Mats(Operator):
    bl_idname = "mats.link"
    bl_label = "Link Materials"

    def execute(self, context):
        bpy.ops.object.make_links_data(type='MATERIAL')
        return {'FINISHED'}
    
class Link_Anidata(Operator):
    bl_idname = "anidata.link"
    bl_label = "Link Animation Data"

    def execute(self, context):
        bpy.ops.object.make_links_data(type='ANIMATION')
        return {'FINISHED'}
    
class Link_Collection(Operator):
    bl_idname = "collection.link"
    bl_label = "Link Collection"

    def execute(self, context):
        bpy.ops.object.make_links_data(type='GROUPS')
        return {'FINISHED'}
    

###COPY
class Copy_Mods(Operator):
    bl_idname = "mods.copy"
    bl_label = "Copy Modifiers"

    def execute(self, context):
        bpy.ops.object.make_links_data(type='MODIFIERS')
        return {'FINISHED'}

class VIEW3D_MT_PIE_copypie(Menu):
    bl_label = "Copy/Link"

    @classmethod
    def poll(cls, context):
        obj = context.active_object
        return obj and obj.type == "MESH"


    def draw(self, context):
        layout = self.layout
        
        pie = layout.menu_pie()
        pie.operator("OBDATA.link", icon="MESH_CUBE")
        pie.operator("MATS.link", icon="MATERIAL")
        pie.operator("ANIDATA.link", icon="ACTION")
        pie.operator("COLLECTION.link", icon="OUTLINER_COLLECTION")
        pie.operator("MODS.copy", icon="MODIFIER_ON")
        


global_addon_keymaps = []


classes = (
    VIEW3D_MT_PIE_copypie,
    Link_Obdata,
    Link_Mats,
    Link_Anidata,
    Link_Collection,
    Copy_Mods,
)



def register():
    for cls in classes:
        bpy.utils.register_class(cls)
    #keymap
    window_manager = bpy.context.window_manager
    if window_manager.keyconfigs.addon:
        keymap = window_manager.keyconfigs.addon.keymaps.new(name='3D View', space_type='VIEW_3D')
        keymap_item = keymap.keymap_items.new('wm.call_menu_pie', 'F', 'PRESS', shift=True)
        keymap_item.properties.name = "VIEW3D_MT_PIE_copypie"
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

    bpy.ops.wm.call_menu_pie(name="VIEW3D_MT_PIE_copypie")