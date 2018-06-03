require 'test_helper'

class EnfermerosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @enfermero = enfermeros(:one)
  end

  test "should get index" do
    get enfermeros_url
    assert_response :success
  end

  test "should get new" do
    get new_enfermero_url
    assert_response :success
  end

  test "should create enfermero" do
    assert_difference('Enfermero.count') do
      post enfermeros_url, params: { enfermero: { apellido: @enfermero.apellido, cargo_id: @enfermero.cargo_id, celular: @enfermero.celular, ci: @enfermero.ci, ciudade_id: @enfermero.ciudade_id, contacto_familiar: @enfermero.contacto_familiar, correo: @enfermero.correo, direccion: @enfermero.direccion, foto: @enfermero.foto, nombre: @enfermero.nombre, nro_registro: @enfermero.nro_registro, telefono: @enfermero.telefono } }
    end

    assert_redirected_to enfermero_url(Enfermero.last)
  end

  test "should show enfermero" do
    get enfermero_url(@enfermero)
    assert_response :success
  end

  test "should get edit" do
    get edit_enfermero_url(@enfermero)
    assert_response :success
  end

  test "should update enfermero" do
    patch enfermero_url(@enfermero), params: { enfermero: { apellido: @enfermero.apellido, cargo_id: @enfermero.cargo_id, celular: @enfermero.celular, ci: @enfermero.ci, ciudade_id: @enfermero.ciudade_id, contacto_familiar: @enfermero.contacto_familiar, correo: @enfermero.correo, direccion: @enfermero.direccion, foto: @enfermero.foto, nombre: @enfermero.nombre, nro_registro: @enfermero.nro_registro, telefono: @enfermero.telefono } }
    assert_redirected_to enfermero_url(@enfermero)
  end

  test "should destroy enfermero" do
    assert_difference('Enfermero.count', -1) do
      delete enfermero_url(@enfermero)
    end

    assert_redirected_to enfermeros_url
  end
end
