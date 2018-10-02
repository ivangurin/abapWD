class zcl_wd_selopt definition
  public
  final
  create public .

*"* public components of class ZCL_WD_SELOPT
*"* do not include other source files here!!!
  public section.

    data r_selopt type ref to if_wd_select_options .

    methods constructor
      importing
        !ir_selopt type ref to iwci_wdr_select_options .
    class-methods get
      importing
        !ir_selopt       type ref to iwci_wdr_select_options
      returning
        value(er_selopt) type ref to zcl_wd_selopt .
    class-methods get_by_usage
      importing
        !ir_usage        type ref to if_wd_component_usage
      returning
        value(er_selopt) type ref to zcl_wd_selopt .
    methods init .
    type-pools abap .
    methods create
      importing
        !i_id         type simple
        !i_type       type simple
        !i_text       type simple optional
        !i_parameter  type abap_bool optional
        !i_checkbox   type abap_bool optional
        !i_dropdown   type abap_bool optional
        !i_readonly   type abap_bool default abap_false
        !i_value      type simple optional
        !it_values    type zivalues optional
        !i_help_str   type ddobjname optional
        !i_help_field type fieldname optional .
    methods update
      importing
        !i_id         type simple
        !i_text       type simple optional
        !i_readonly   type abap_bool optional
        !i_obligatory type abap_bool optional
        !i_value      type data optional
        !it_range     type zirange optional .
    methods remove
      importing
        !i_id type simple .
    methods reset .
    methods check
      raising
        zcx_generic .
    methods set_range
      importing
        !i_id     type string
        !it_range type zirange optional .
    methods get_range
      importing
        !i_id           type string
      returning
        value(et_range) type zirange .
    methods set_value
      importing
        !i_id    type string
        !i_value type data optional .
    methods get_value
      importing
        !i_id          type string
      returning
        value(e_value) type string .
  protected section.
*"* protected components of class ZCL_WD_SELOPT
*"* do not include other source files here!!!
  private section.
*"* private components of class ZCL_WD_SELOPT
*"* do not include other source files here!!!

    class-data dummy type dummy .
ENDCLASS.



CLASS ZCL_WD_SELOPT IMPLEMENTATION.


  method check.

    data l_errors type i.
    r_selopt->check_all_selection_fields(
      importing
        e_num_error_msgs = l_errors ).

    if l_errors ne 0.
      zcx_generic=>raise( ).
    endif.

  endmethod.


  method constructor.

    r_selopt = ir_selopt->init_selection_screen( ).

    init( ).

  endmethod.


  method create.

    data l_id type string.
    l_id = i_id.

    data l_type type string.
    l_type = i_type.

    data l_text type string.
    l_text = i_text.

    data lt_values type wdy_key_value_table.
    lt_values = it_values.

    data lr_data type ref to data.
    lr_data = r_selopt->create_range_table( l_type ).

    if i_parameter eq abap_true or
       i_dropdown  eq abap_true or
       i_checkbox  eq abap_true.

      r_selopt->add_selection_field(
        i_id                         = l_id
        i_description                = l_text
        i_no_extension               = abap_true
        i_no_intervals               = abap_true
        i_no_complex_restrictions    = abap_true
        i_as_dropdown                = i_dropdown
        i_as_checkbox                = i_checkbox
        i_read_only                  = i_readonly
        i_value_help_structure       = i_help_str
        i_value_help_structure_field = i_help_field
        it_value_set                 = lt_values
        it_result                    = lr_data ).

    else.

      r_selopt->add_selection_field(
        i_id                         = l_id
        i_description                = l_text
        i_read_only                  = i_readonly
        i_value_help_structure       = i_help_str
        i_value_help_structure_field = i_help_field
        it_result                    = lr_data ).

    endif.

    if i_value is not initial.
      set_value(
        i_id    = l_id
        i_value = i_value ).
    endif.

  endmethod.


  method get.

    create object er_selopt
      exporting
        ir_selopt = ir_selopt.

  endmethod.


  method get_by_usage.

    if ir_usage->has_active_component( ) eq abap_false.
      ir_usage->create_component( ).
    endif.

    data lr_controller type ref to iwci_wdr_select_options.
    lr_controller ?= ir_usage->get_interface_controller( ).

    er_selopt = get( lr_controller ).

  endmethod.


  method get_range.

    data lt_fields type if_wd_select_options=>tt_selection_screen_item.
    r_selopt->get_selection_fields(
      importing
        et_fields = lt_fields ).

    data ls_field like line of lt_fields.
    read table lt_fields transporting no fields with key m_id = i_id.
    check sy-subrc eq 0.

    data lr_range type ref to data.
    lr_range = r_selopt->get_range_table_of_sel_field( i_id ).
    assert lr_range is bound.

    field-symbols <lt_range> type any table.
    assign lr_range->* to <lt_range>.

    field-symbols <ls_range> type any.
    loop at <lt_range> assigning <ls_range>.

      field-symbols <es_range> like line of et_range.
      append initial line to et_range assigning <es_range>.
      move-corresponding <ls_range> to <es_range>.

    endloop.

  endmethod.


  method get_value.

    data lt_fields type if_wd_select_options=>tt_selection_screen_item.
    r_selopt->get_selection_fields(
      importing
        et_fields = lt_fields ).

    data ls_field like line of lt_fields.
    read table lt_fields transporting no fields with key m_id = i_id.
    check sy-subrc eq 0.

    data lr_value type ref to data.
    lr_value = r_selopt->get_range_table_of_sel_field( i_id ).
    assert lr_value is bound.

    field-symbols <lt_range> type standard table.
    assign lr_value->* to <lt_range>.

    field-symbols <ls_range> type any.
    read table <lt_range> assigning <ls_range> index 1.
    check sy-subrc eq 0.

    field-symbols <l_value> type any.
    assign component 'LOW' of structure <ls_range> to <l_value>.

    e_value = <l_value>.

  endmethod.


  method init.

    r_selopt->set_global_options(
      i_display_btn_cancel  = abap_false
      i_display_btn_check   = abap_false
      i_display_btn_reset   = abap_false
      i_display_btn_execute = abap_false ).

  endmethod.


  method remove.

    data l_id type string.
    l_id = i_id.

    r_selopt->remove_selection_screen_item( l_id ).

  endmethod.


  method reset.

    r_selopt->reset_all_selection_fields( ).

  endmethod.


  method set_range.

    data lr_value type ref to data.
    lr_value = r_selopt->get_range_table_of_sel_field( i_id ).
    assert lr_value is bound.

    field-symbols <lt_range> type standard table.
    assign lr_value->* to <lt_range>.
    clear <lt_range>.

    if it_range is not supplied.
      return.
    endif.

    data ls_range like line of it_range.
    loop at it_range into ls_range.
      field-symbols <ls_range> type any.
      append initial line to <lt_range> assigning <ls_range>.
      move-corresponding ls_range to <ls_range>.
    endloop.

  endmethod.


  method set_value.

*  data lr_selopt type ref to cl_wdr_select_options.
*  lr_selopt ?= r_selopt.
*  if lr_selopt->m_root_node is not bound.
*    return.
*  endif.

    data lr_value type ref to data.
    lr_value = r_selopt->get_range_table_of_sel_field( i_id ).
    assert lr_value is bound.

    field-symbols <lt_range> type standard table.
    assign lr_value->* to <lt_range>.
    clear <lt_range>.

    if i_value is not supplied.
      return.
    endif.

    field-symbols <ls_range> type any.
    append initial line to <lt_range> assigning <ls_range>.

    field-symbols <l_value> type any.
    assign component 'SIGN' of structure <ls_range> to <l_value>.
    <l_value> = 'I'.

    assign component 'OPTION' of structure <ls_range> to <l_value>.
    <l_value> = 'EQ'.

    assign component 'LOW' of structure <ls_range> to <l_value>.
    <l_value> = i_value.

  endmethod.


  method update.

    data l_id type string.
    l_id = i_id.

    data l_text type string.
    if i_text is supplied.
      l_text = i_text.
    else.
      r_selopt->get_selection_field(
        exporting i_id = l_id
        importing e_description = l_text ).
    endif.

    if i_readonly is supplied.
      r_selopt->upd_selection_field(
        i_id        = l_id
        i_read_only = i_readonly ).
    endif.

    if i_obligatory is supplied.
      r_selopt->upd_selection_field(
        i_id         = l_id
        i_obligatory = i_obligatory ).
    endif.

    if i_value is supplied.
      set_value(
        i_id    = l_id
        i_value = i_value ).
    endif.

    if it_range is supplied.
      set_range(
        i_id    = l_id
        it_range = it_range ).
    endif.

    if l_text is not initial.
      r_selopt->upd_selection_field(
        i_id          = l_id
        i_description = l_text ).
    endif.

  endmethod.
ENDCLASS.
