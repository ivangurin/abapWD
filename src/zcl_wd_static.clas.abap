class zcl_wd_static definition
  public
  final
  create public .

*"* public components of class ZCL_WD_STATIC
*"* do not include other source files here!!!
  public section.

    types:
      begin of ts_metadata,
        field       type fieldname,
        visible(1),
        enabled(1),
        editable(1),
        required(1),
      end of ts_metadata .
    types:
      tt_metadata type table of ts_metadata .

    constants icon_approve type string value '~Icon/Approve' ##NO_TEXT.
    constants icon_delete type string value '~Icon/Delete' ##NO_TEXT.
    constants icon_failure type string value '~Icon/Failure' ##NO_TEXT.
    constants icon_green_led type string value '~Icon/GreenLed' ##NO_TEXT.
    constants icon_red_led type string value '~Icon/RedLed' ##NO_TEXT.
    constants icon_refresh type string value '~Icon/TbRefresh' ##NO_TEXT.
    constants icon_yellow_led type string value '~Icon/YellowLed' ##NO_TEXT.

    class-methods get_url
      importing
        !i_app         type simple
        !i_guid        type simple optional
        !i_language    type langu default sy-langu
        !it_parameters type tihttpnvp optional
      returning
        value(e_url)   type string .
    class-methods open_url
      importing
        !ir_controller type ref to if_wd_component
        !i_url         type string .
    class-methods clear_messages
      importing
        !ir_controller type ref to if_wd_component .
    class-methods add_message
      importing
        !ir_controller type ref to if_wd_component
        !is_message    type zsmessage optional .
    class-methods add_messages
      importing
        !ir_controller type ref to if_wd_component optional
        !it_messages   type zimessages .
    class-methods file_download
      importing
        !i_file type simple
        !i_data type xstring .
    class-methods get_parameter
      importing
        !i_name        type data
      returning
        value(e_value) type string .
    class-methods get_guid
      returning
        value(e_guid) type guid .
    class-methods create_usage
      importing
        !ir_controller type ref to if_wd_component
        !i_component   type string
        !i_usage       type string optional
        !i_refresh     type abap_bool default abap_true .
    class-methods conf_window
      importing
        !ir_window       type ref to if_wd_window optional
        !ir_view         type ref to if_wd_view_controller optional
        !i_window        type simple optional
        !i_title         type simple optional
        !i_width         type simple optional
        !i_height        type simple optional
        !i_button_kind   type wdr_popup_button_kind default if_wd_window=>co_buttons_none
        !i_action_ok     type simple optional
        !i_text_ok       type simple optional
        !i_action_cancel type simple optional
        !i_text_cancel   type simple optional
        !i_action_close  type simple optional
        !i_action_yes    type simple optional
        !i_action_no     type simple optional
        !i_fpm           type abap_bool default abap_false
        !i_open          type abap_bool default abap_true
        !i_close         type abap_bool default abap_true .
    class-methods open_window
      importing
        !ir_controller   type ref to if_wd_component
        !ir_view         type ref to if_wd_view_controller optional
        !i_window        type simple
        !i_title         type simple optional
        !i_button_kind   type wdr_popup_button_kind default if_wd_window=>co_buttons_none
        !i_action_ok     type simple optional
        !i_text_ok       type simple optional
        !i_action_cancel type simple optional
        !i_text_cancel   type simple optional
        !i_action_close  type simple optional
        !i_action_yes    type simple optional
        !i_action_no     type simple optional
        !i_open          type abap_bool default abap_true
        !i_button_close  type abap_bool default abap_true
        !i_close         type abap_bool default abap_true
        !i_width         type simple optional
      returning
        value(er_window) type ref to if_wd_window .
    class-methods open_usage_window
      importing
        !ir_controller   type ref to if_wd_component
        !ir_view         type ref to if_wd_view_controller optional
        !i_component     type simple optional
        !i_usage         type simple optional
        !i_refresh       type abap_bool default abap_true
        !i_window        type simple default 'W_MAIN'
        !i_title         type simple optional
        !i_button_kind   type wdr_popup_button_kind default if_wd_window=>co_buttons_none
        !i_action_ok     type simple optional
        !i_text_ok       type simple optional
        !i_action_cancel type simple optional
        !i_text_cancel   type simple optional
        !i_action_close  type simple optional
        !i_action_yes    type simple optional
        !i_action_no     type simple optional
        !i_open          type abap_bool default abap_true
        !i_close         type abap_bool default abap_true
      returning
        value(er_window) type ref to if_wd_window .
    class-methods open_confirmation_popup
      importing
        !ir_controller   type ref to if_wd_component
        !ir_view         type ref to if_wd_view_controller optional
        !i_title         type simple optional
        !i_text          type simple
        !i_message_type  type wdr_popup_msg_type default if_wd_window=>co_msg_type_none
        !i_button_kind   type wdr_popup_button_kind default if_wd_window=>co_buttons_okcancel
        !i_action_ok     type string optional
        !i_action_cancel type string optional
        !i_action_yes    type string optional
        !i_action_no     type string optional
        !i_action_close  type string optional
        !i_open          type abap_bool default abap_true
      returning
        value(er_popup)  type ref to if_wd_window .
    class-methods open_search_help
      importing
        !ir_controller   type ref to if_wd_component
        !ir_view         type ref to if_wd_view_controller
        !i_search_help   type simple
        !i_field_name    type simple
        !i_event_handler type simple
        !i_multi_select  type abap_bool default abap_false
      raising
        zcx_generic .
    class-methods close
      importing
        !ir_view type ref to if_wd_view_controller
        !i_plug  type simple default 'EXIT' .
    class-methods get_elements
      importing
        !ir_view           type ref to if_wd_view
        !i_name            type simple default 'ROOTUIELEMENTCONTAINER'
      returning
        value(et_elements) type wdr_view_elements .
    class-methods set_metadata
      importing
        !ir_view     type ref to if_wd_view
        !it_metadata type tt_metadata
        !i_readonly  type abap_bool default abap_false .
    class-methods is_config_mode
      returning
        value(e_is) type abap_bool .
    class-methods is_portal_mode
      importing
        !ir_controller type ref to if_wd_component
      returning
        value(e_is)    type abap_bool
      raising
        zcx_generic .
    class-methods is_debug_mode
      returning
        value(e_is) type abap_bool .
  protected section.
*"* protected components of class ZCLSRM_WD
*"* do not include other source files here!!!
  private section.
*"* private components of class ZCL_WD_STATIC
*"* do not include other source files here!!!
ENDCLASS.



CLASS ZCL_WD_STATIC IMPLEMENTATION.


  method add_message.

    data ls_message like is_message.
    if is_message is supplied.
      ls_message = is_message.
    else.
      move-corresponding sy to ls_message.
    endif.

    if ls_message-msgty ca 'AX'.
      ls_message-msgty = 'E'.
    endif.

    data lr_message_manager type ref to if_wd_message_manager.
    lr_message_manager = ir_controller->get_message_manager( ).

    lr_message_manager->report_t100_message(
      msgid = ls_message-msgid
      msgno = ls_message-msgno
      msgty = ls_message-msgty
      p1    = ls_message-msgv1
      p2    = ls_message-msgv2
      p3    = ls_message-msgv3
      p4    = ls_message-msgv4 ).

  endmethod.


  method add_messages.

    data ls_message like line of it_messages.
    loop at it_messages into ls_message.

      add_message(
        ir_controller = ir_controller
        is_message    = ls_message ).

    endloop.

  endmethod.


  method clear_messages.

    data lr_message_manager type ref to if_wd_message_manager.
    lr_message_manager = ir_controller->get_message_manager( ).

    lr_message_manager->clear_messages( ).

  endmethod.


  method close.

    data lr_controller type ref to if_wd_window_controller.
    lr_controller = ir_view->get_embedding_window_ctlr( ).

    data lr_window type ref to if_wd_window.
    lr_window = lr_controller->get_window( ).

    if lr_window is bound.

      lr_window->close( ).

    else.

      data lt_parameters type wdr_event_parameter_list.
      data ls_parameter like line of lt_parameters.
      ls_parameter-name = 'CLOSE_WINDOW'.
      create data ls_parameter-value type c.

      field-symbols <lv_value> type any.
      assign ls_parameter-value->* to <lv_value>.
      <lv_value> = abap_true.

      insert ls_parameter into table lt_parameters.

      data l_plug type string.
      l_plug = i_plug.

      lr_controller->if_wd_view_controller~fire_plug(
        plug_name  = l_plug
        parameters = lt_parameters ).

    endif.

  endmethod.


  method conf_window.

    if ir_window is bound.
      data lr_window like ir_window.
      lr_window = ir_window.
    else.
      lr_window = ir_view->get_embedding_window( ).
    endif.

    if i_title is not initial.

      data l_title type string.
      l_title = i_title.

      lr_window->set_window_title( l_title ).

    endif.

    if i_width is not initial or
       i_height is not initial.

      data l_width type string.
      l_width = i_width.

      data l_height type string.
      l_height = i_height.

      lr_window->set_window_size(
        width  = l_width
        height = l_height ).

    endif.

    if i_button_kind is not initial.
      lr_window->set_button_kind( i_button_kind ).
    endif.

    lr_window->set_close_in_any_case( i_close ).

    lr_window->set_window_position( position = if_wd_window=>co_center ).

    if i_action_ok is not initial.

      assert ir_view is bound.

      if i_fpm eq abap_true.

        data l_action type string.
        l_action = 'CONFIRM_ACTION'.

***        data lt_event_mapping type /sapsrm/t_ch_wd_event_mapping.
***        field-symbols <ls_event_mapping> like line of lt_event_mapping.
***        append initial line to lt_event_mapping assigning <ls_event_mapping>.
***        <ls_event_mapping>-action_name = 'ON_OK'.
***        <ls_event_mapping>-event_name  = i_action_ok.

      else.
        l_action = i_action_ok.
      endif.

      if i_text_ok is initial.
        data l_button_text type string.
        l_button_text = text-001.
      else.
        l_button_text = i_text_ok.
      endif.

      lr_window->subscribe_to_button_event(
        button      = if_wd_window=>co_button_ok
        button_text = l_button_text
        action_name = l_action
        action_view = ir_view ).

    endif.

    if i_action_cancel is not initial.

      assert ir_view is bound.

      if i_fpm eq abap_true.

        l_action = 'CONFIRM_ACTION'.

***        append initial line to lt_event_mapping assigning <ls_event_mapping>.
***        <ls_event_mapping>-action_name = 'ON_OK'.
***        <ls_event_mapping>-event_name  = i_action_ok.

      else.
        l_action = i_action_ok.
      endif.

      if i_text_cancel is initial.
        l_button_text = text-002.
      else.
        l_button_text = i_text_cancel.
      endif.

      lr_window->subscribe_to_button_event(
        button      = if_wd_window=>co_button_cancel
        button_text = l_button_text
        action_name = i_action_cancel
        action_view = ir_view ).

    endif.

    if i_action_yes is not initial.

      assert ir_view is bound.

      lr_window->subscribe_to_button_event(
        button      = if_wd_window=>co_button_yes
        action_name = i_action_yes
        action_view = ir_view ).

    endif.

    if i_action_no is not initial.

      assert ir_view is bound.

      lr_window->subscribe_to_button_event(
        button      = if_wd_window=>co_button_no
        action_name = i_action_no
        action_view = ir_view ).

    endif.

    if i_action_close is not initial.

      assert ir_view is bound.

      lr_window->set_on_close_action(
        action_name = i_action_close
        view        = ir_view ).

    endif.

    if i_fpm eq abap_true.
***      ir_view->get_context( )->root_node->get_child_node(
***        name = 'EVENT_MAPPING' )->bind_table(
***          new_items = lt_event_mapping ).
    endif.

  endmethod.


  method create_usage.

    if i_usage is initial.
      data l_usage type string.
      l_usage = i_component.
    else.
      l_usage = i_usage.
    endif.

    if ir_controller->has_cmp_usage_group( i_component ) eq abap_false.

      data lr_group type ref to if_wd_component_usage_group.
      lr_group =
        ir_controller->create_cmp_usage_group(
          name            = i_component
          used_component  = l_usage ).

    else.

      if i_refresh eq abap_true.

        data ls_usage type wdapi_component_usage.
        ls_usage = ir_controller->get_component_usage( l_usage ).

        if ls_usage-component_usage->has_active_component( ) eq abap_true.
          ls_usage-component_usage->delete_component( ).
        endif.

      endif.

    endif.

  endmethod.


  method file_download.

    data l_file type string.
    l_file = i_file.

    cl_wd_runtime_services=>attach_file_to_response(
      i_filename  = l_file
      i_mime_type = zcl_file_static=>get_mime( l_file )
      i_content   = i_data ).

  endmethod.


  method get_elements.

    data l_name type string.
    l_name = i_name.

    data lr_element like line of et_elements.
    lr_element ?= ir_view->get_element( l_name ).

    check lr_element is bound.

    insert lr_element into table et_elements.

    case lr_element->_definition_name.
      when 'TRANSPARENT_CONTAINER' or 'GROUP' or 'TRAY'.

        data lr_container type ref to cl_wd_uielement_container.
        lr_container ?= lr_element.

        data lt_elements like et_elements.
        lt_elements = lr_container->get_children( ).

      when 'PAGE_HEADER'.

        data lr_page_header type ref to cl_wd_page_header.
        lr_page_header ?= lr_element.

        data lt_page_areas type cl_wd_page_header_area=>tt_page_header_area.
        lt_page_areas = lr_page_header->get_areas( ).

        data lr_page_area like line of lt_page_areas.
        loop at lt_page_areas into lr_page_area.

          lr_element ?= lr_page_area.

          insert lr_element into table lt_elements.

        endloop.

      when 'PAGE_HEADER_AREA'.

        lr_page_area ?= lr_element.

        lr_element ?= lr_page_area->get_content( ).

        check lr_element is bound.

        insert lr_element into table lt_elements.

      when 'TABSTRIP'.

        data lr_tabstip type ref to cl_wd_tabstrip.
        lr_tabstip ?= lr_element.

        data lt_tabs type wd_tr_tab.
        lt_tabs = lr_tabstip->get_tabs( ).

        data lr_tab type ref to cl_wd_tab.
        loop at lt_tabs into lr_tab.

          lr_element ?= lr_tab->get_content( ).

          check lr_element is bound.

          insert lr_element into table lt_elements.

        endloop.

      when 'TOOLBAR'.

        data lr_toolbar type ref to cl_wd_toolbar.
        lr_toolbar ?= lr_element.

        data lt_toolbar_items type if_wd_toolbar_item=>tt_toolbar_item.
        lt_toolbar_items = lr_toolbar->get_toolbar_items( ).

        data lr_toolbar_item like line of lt_toolbar_items.
        loop at lt_toolbar_items into lr_toolbar_item.

          lr_element ?= lr_toolbar_item.

          insert lr_element into table lt_elements.

        endloop.

      when 'TOOLBAR_BTN_CHOICE'.

        data lr_toolbar_btn_choice type ref to cl_wd_toolbar_btn_choice.
        lr_toolbar_btn_choice ?= lr_element.

        data lt_choices type cl_wd_menu_action_item=>tt_menu_action_item.
        lt_choices = lr_toolbar_btn_choice->get_choices( ).

        data lr_choice like line of lt_choices.
        loop at lt_choices into lr_choice.

          lr_element ?= lr_choice.

          insert lr_element into table lt_elements.

        endloop.

      when others.
        return.

    endcase.

    loop at lt_elements into lr_element.

      l_name = lr_element->get_id( ).

      data lt_elements2 like et_elements.
      lt_elements2 =
        get_elements(
          ir_view = ir_view
          i_name  = l_name ).

      insert lines of lt_elements2 into table et_elements.

    endloop.

  endmethod.


  method get_guid.

    e_guid = get_parameter( 'guid' ).

  endmethod.


  method get_parameter.

    data l_name type string.
    l_name = i_name.

    e_value = cl_wd_runtime_services=>get_url_parameter( l_name ).

  endmethod.


  method get_url.

    data l_app type string.
    l_app = i_app.

    data lt_parameters like it_parameters.
    lt_parameters = it_parameters.

    field-symbols <ls_parameter> like line of lt_parameters.
    read table lt_parameters transporting no fields
      with key
        name = 'sap-ui-language'.
    if sy-subrc ne 0.
      append initial line to lt_parameters assigning <ls_parameter>.
      <ls_parameter>-name  = 'sap-ui-language'.
      <ls_parameter>-value = zcl_abap_static=>write( i_language ).
    endif.

    if i_guid is not initial.
      append initial line to lt_parameters assigning <ls_parameter>.
      <ls_parameter>-name  = 'guid'.
      <ls_parameter>-value = i_guid.
    endif.

    call method cl_wd_utilities=>construct_wd_url
      exporting
        application_name = l_app
        in_parameters    = lt_parameters
      importing
        out_absolute_url = e_url.

  endmethod.


  method is_config_mode.

    e_is = get_parameter( 'sap-config-mode' ).

  endmethod.


  method is_debug_mode.

    e_is = get_parameter( 'debug' ).

  endmethod.


  method is_portal_mode.

    data lr_manager type ref to if_wd_portal_integration.
    lr_manager = ir_controller->get_portal_manager( ).

    if lr_manager->m_portal_version is not initial.
      e_is = abap_true.
    endif.

  endmethod.


  method open_confirmation_popup.

    data lr_window_manager type ref to if_wd_window_manager.
    lr_window_manager = ir_controller->get_window_manager( ).

    data l_title type string.
    l_title = i_title.

    data l_text type string.
    l_text = i_text.

    data lt_text type string_table.
    insert l_text into table lt_text.

    er_popup = lr_window_manager->create_popup_to_confirm(
      text            = lt_text
      button_kind     = i_button_kind
      message_type    = i_message_type
      window_title    = l_title
      window_position = if_wd_window=>co_center ).

    if i_action_ok is not initial.
      assert ir_view is bound.
      er_popup->subscribe_to_button_event(
        exporting
          button            = if_wd_window=>co_button_ok
          action_name       = i_action_ok
          action_view       = ir_view ).
    endif.

    if i_action_cancel is not initial.
      assert ir_view is bound.
      er_popup->subscribe_to_button_event(
        exporting
          button            = if_wd_window=>co_button_cancel
          action_name       = i_action_cancel
          action_view       = ir_view ).
    endif.

    if i_action_yes is not initial.
      assert ir_view is bound.
      er_popup->subscribe_to_button_event(
        exporting
          button            = if_wd_window=>co_button_yes
          action_name       = i_action_yes
          action_view       = ir_view ).
    endif.

    if i_action_no is not initial.
      assert ir_view is bound.
      er_popup->subscribe_to_button_event(
        exporting
          button            = if_wd_window=>co_button_no
          action_name       = i_action_no
          action_view       = ir_view ).
    endif.

    if i_action_close is not initial.
      assert ir_view is bound.
      er_popup->set_on_close_action(
        exporting
          action_name = i_action_close
          view        = ir_view ).
    endif.

    er_popup->set_window_position( position = if_wd_window=>co_center ).

    if i_open eq abap_true.
      er_popup->open( ).
    endif.

  endmethod.


  method open_search_help.

    data l_search_help type shlpname.
    l_search_help = i_search_help.

    data l_field_name type string.
    l_field_name = i_field_name.

    data l_event_handler type string.
    l_event_handler = i_event_handler.

    data lr_window_manager type ref to if_wd_window_manager.
    lr_window_manager = ir_controller->get_window_manager( ).

    try.

        lr_window_manager->open_value_help(
          view          = ir_view
          event_handler = l_event_handler
          searchhelp    = l_search_help
          fieldname     = l_field_name
          multi_select  = i_multi_select ).

        data lx_exception type ref to cx_wd_valuehelp.
      catch cx_wd_valuehelp into lx_exception.
        zcx_generic=>raise(
          i_text = lx_exception->get_text( ) ).
    endtry.

  endmethod.


  method open_url.

    check i_url is not initial.

    data lr_window_manager type ref to if_wd_window_manager.
    lr_window_manager ?= ir_controller->get_window_manager( ).

    data lr_window type ref to if_wd_window.
    lr_window =
      lr_window_manager->create_external_window(
        url = i_url ).

    lr_window->open( ).

  endmethod.


  method open_usage_window.

    if i_usage is initial.
      data l_usage type string.
      l_usage = i_component.
    else.
      l_usage = i_usage.
    endif.

    if i_component is not initial.

      create_usage(
        ir_controller = ir_controller
        i_component   = i_component
        i_usage       = l_usage
        i_refresh     = i_refresh ).

    endif.

    data l_window type string.
    l_window = i_window.

    data lr_window_manager type ref to if_wd_window_manager.
    lr_window_manager = ir_controller->get_window_manager( ).

    er_window =
      lr_window_manager->create_window_for_cmp_usage(
        interface_view_name  = l_window
        component_usage_name = l_usage
        message_display_mode = if_wd_window=>co_msg_display_mode_selected
        close_in_any_case    = i_close
        is_resizable         = abap_true ).

    conf_window(
      ir_window       = er_window
      ir_view         = ir_view
      i_title         = i_title
      i_button_kind   = i_button_kind
      i_action_ok     = i_action_ok
      i_text_ok       = i_text_ok
      i_action_cancel = i_action_cancel
      i_text_cancel   = i_text_cancel
      i_action_close  = i_action_close
      i_action_yes    = i_action_yes
      i_action_no     = i_action_no
      i_open          = i_open
      i_close         = i_close ).

  endmethod.


  method open_window.

    data lr_window_manager type ref to if_wd_window_manager.
    lr_window_manager = ir_controller->get_window_manager( ).

    data l_window type string.
    l_window = i_window.

    data l_title type string.
    l_title = i_title.

    er_window =
      lr_window_manager->create_window(
        window_name          = l_window
        title                = l_title
        is_resizable         = abap_true
        message_display_mode = if_wd_window=>co_msg_display_mode_selected
        message_type         = if_wd_window=>co_msg_type_none
        button_kind          = i_button_kind
        close_button         = i_button_close
        close_in_any_case    = i_close ).

    conf_window(
      ir_window       = er_window
      ir_view         = ir_view
      i_title         = i_title
      i_button_kind   = i_button_kind
      i_action_ok     = i_action_ok
      i_text_ok       = i_text_ok
      i_action_cancel = i_action_cancel
      i_text_cancel   = i_text_cancel
      i_action_close  = i_action_close
      i_action_yes    = i_action_yes
      i_action_no     = i_action_no
      i_close         = i_close
      i_width         = i_width ).

    " Open
    if i_open eq abap_true.
      er_window->open( ).
    endif.

  endmethod.


  method set_metadata.

    define set_visible.
      if &2-visible eq zcl_abap_static=>yes.
        &1->set_visible( 02 ).
      elseif &2-visible eq zcl_abap_static=>no.
        &1->set_visible( 01 ).
      endif.
    end-of-definition.

    define set_visible_boolean.
      if &2-visible eq zcl_abap_static=>yes.
        &1->set_visible( abap_true ).
      elseif &2-visible eq zcl_abap_static=>no.
        &1->set_visible( abap_false ).
      endif.
    end-of-definition.

    define set_enabled.
      if &2-enabled eq zcl_abap_static=>yes.
        &1->set_enabled( abap_true ).
      elseif &2-enabled eq zcl_abap_static=>no.
        &1->set_enabled( abap_false ).
      endif.
    end-of-definition.

    define set_editable.
      if &2-editable eq zcl_abap_static=>yes.
        &1->set_read_only( abap_false ).
      elseif &2-editable eq zcl_abap_static=>no.
        &1->set_read_only( abap_true ).
      endif.
    end-of-definition.

    define set_required.
      if &2-required = zcl_abap_static=>yes.
        &1->set_state( 1 ).
      elseif &2-required = zcl_abap_static=>no.
        &1->set_state( 0 ).
      endif.
    end-of-definition.

    define set_all.
      set_visible &1 &2.
      set_enabled &1 &2.
      set_editable &1 &2.
      set_required &1 &2.
    end-of-definition.

    " Получаем элементы экрана
    data lt_elements type wdr_view_elements.
    lt_elements = zcl_wd_static=>get_elements( ir_view ).

    " Обрабатываем элементы экрана в соответствии с метаданными
    data lr_element like line of lt_elements.
    loop at lt_elements into lr_element.

      data ls_metadata like line of it_metadata.
      clear ls_metadata.
      read table it_metadata into ls_metadata
        with key
          field = lr_element->id.
      check sy-subrc eq 0.

      if i_readonly eq abap_true.
        ls_metadata-editable = zcl_abap_static=>no.
      endif.

      if lr_element->_definition_name = 'LABEL'.

        data lr_label type ref to cl_wd_label.
        lr_label ?= lr_element.

        set_visible lr_label ls_metadata.
        set_enabled lr_label ls_metadata.

      elseif lr_element->_definition_name = 'INPUT_FIELD'.

        data lr_input_field type ref to cl_wd_input_field.
        lr_input_field ?= lr_element.

        set_all lr_input_field ls_metadata.

      elseif lr_element->_definition_name = 'TEXT_EDIT'.

        data lr_text_edit type ref to cl_wd_text_edit.
        lr_text_edit ?= lr_element.

        set_all lr_text_edit ls_metadata.

      elseif lr_element->_definition_name = 'DROPDOWN_BY_KEY'.

        data lr_dropkey type ref to cl_wd_dropdown_by_key.
        lr_dropkey ?= lr_element.

        set_all lr_dropkey ls_metadata.

      elseif lr_element->_definition_name = 'DROPDOWN_BY_IDX'.

        data lr_dropidx type ref to cl_wd_dropdown_by_idx.
        lr_dropidx ?= lr_element.

        set_all lr_dropidx ls_metadata.

      elseif lr_element->_definition_name = 'BUTTON'.

        data lr_button type ref to cl_wd_button.
        lr_button ?= lr_element.

        set_visible lr_button ls_metadata.
        set_enabled lr_button ls_metadata.

      elseif lr_element->_definition_name = 'TOOLBAR'.

        data lr_toolbar type ref to cl_wd_toolbar.
        lr_toolbar ?= lr_element.

        set_visible lr_toolbar ls_metadata.
        set_enabled lr_toolbar ls_metadata.

      elseif lr_element->_definition_name = 'TOOLBAR_BUTTON'.

        data lr_toolbar_button type ref to cl_wd_toolbar_button.
        lr_toolbar_button ?= lr_element.

        set_visible lr_toolbar_button ls_metadata.
        set_enabled lr_toolbar_button ls_metadata.

      elseif lr_element->_definition_name = 'TOOLBAR_BTN_CHOICE'.

        data lr_toolbar_btn_choice type ref to cl_wd_toolbar_btn_choice.
        lr_toolbar_btn_choice ?= lr_element.

        set_visible lr_toolbar_btn_choice ls_metadata.
        set_enabled lr_toolbar_btn_choice ls_metadata.

      elseif lr_element->_definition_name = 'MENU_ACTION_ITEM'.

        data lr_menu_action_item type ref to cl_wd_menu_item.
        lr_menu_action_item ?= lr_element.

        set_visible_boolean lr_menu_action_item ls_metadata.

      elseif lr_element->_definition_name = 'TRANSPARENT_CONTAINER'.

        data lr_container type ref to cl_wd_transparent_container.
        lr_container ?= lr_element.

        set_visible lr_container ls_metadata.
        set_enabled lr_container ls_metadata.

      elseif lr_element->_definition_name = 'TRAY'.

        data lr_tray type ref to cl_wd_tray.
        lr_tray ?= lr_element.

        set_visible lr_tray ls_metadata.
        set_enabled lr_tray ls_metadata.

      elseif lr_element->_definition_name = 'VIEW_CONTAINER_UIELEMENT'.

        data lr_vcuie type ref to cl_wd_view_container_uielement.
        lr_vcuie ?= lr_element.

        set_visible lr_vcuie ls_metadata.
        set_enabled lr_vcuie ls_metadata.

      elseif lr_element->_definition_name = 'CHECKBOX'.

        data lr_checkbox type ref to cl_wd_checkbox.
        lr_checkbox ?= lr_element.

        set_all lr_checkbox ls_metadata.

      elseif lr_element->_definition_name = 'LINK_TO_ACTION'.

        data lr_lnk_a type ref to cl_wd_link_to_action.
        lr_lnk_a ?= lr_element.

        set_visible lr_lnk_a ls_metadata.
        set_enabled lr_lnk_a ls_metadata.

      elseif lr_element->_definition_name = 'IMAGE'.

        data lr_image type ref to cl_wd_image.
        lr_image ?= lr_element.

        set_visible lr_image ls_metadata.
        set_enabled lr_image ls_metadata.

      elseif lr_element->_definition_name = 'GROUP'.

        data lr_group type ref to cl_wd_group.
        lr_group ?= lr_element.

        set_visible lr_group ls_metadata.
        set_enabled lr_group ls_metadata.

      elseif lr_element->_definition_name = 'TEXT_VIEW'.

        data lr_text_view type ref to cl_wd_text_view.
        lr_text_view ?= lr_element.

        set_visible lr_text_view ls_metadata.
        set_enabled lr_text_view ls_metadata.

      elseif lr_element->_definition_name = 'FORMATTED_TEXT_VIEW'.

        data lr_formatted_text_view type ref to cl_wd_formatted_text_view.
        lr_formatted_text_view ?= lr_element.

        set_visible lr_formatted_text_view ls_metadata.
        set_enabled lr_formatted_text_view ls_metadata.

      elseif lr_element->_definition_name = 'TABLE'.

        data lr_table type ref to cl_wd_table.
        lr_table ?= lr_element.

        set_visible lr_table ls_metadata.

        data lt_table_columns type cl_wd_abstr_table_column=>tt_abstr_table_column.
        lt_table_columns = lr_table->get_grouped_columns( ).

        data ls_column like line of lt_table_columns.
        loop at lt_table_columns into ls_column.

          data ls_col_meta like line of it_metadata.
          read table it_metadata into ls_col_meta
            with key
              field = ls_column->id.

          check sy-subrc eq 0.

          data lr_table_column type ref to cl_wd_table_column.
          lr_table_column ?= ls_column.

          data lr_table_cell_editor type ref to if_wd_table_cell_editor.
          lr_table_cell_editor = lr_table_column->get_table_cell_editor( ).

          set_visible ls_column ls_col_meta.

          lr_element ?= lr_table_cell_editor.

          try.

              case lr_element->_definition_name.
                when 'INPUT_FIELD'.

                  lr_input_field ?= lr_table_cell_editor.

                  set_all lr_input_field ls_col_meta.

                when 'TEXT_EDIT'.

                  lr_text_edit ?= lr_table_cell_editor.

                  set_all lr_text_edit ls_col_meta.

                when 'CHECKBOX'.

                  lr_checkbox ?= lr_table_cell_editor.

                  set_all lr_checkbox ls_col_meta.

              endcase.

            catch cx_root.
          endtry.

        endloop.

      endif.

    endloop.

  endmethod.
ENDCLASS.
