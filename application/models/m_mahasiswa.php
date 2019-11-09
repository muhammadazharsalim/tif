<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class M_mahasiswa extends CI_Model {
    public function tampil(){
        $query = $this->db->get('tampil');
        return $query->result_array();
    }
 
    public function tampilubah($id_mahasiswa){
        $this->db->where('id_mahasiswa', $id_mahasiswa);
        $query = $this->db->get('mahasiswa');
        return $query->result_array();
    }

    public function tambah_data(){
        $data = array(
            'id_mahasiswa' => $this->input->post('id_mahasiswa'),
            'nim' => $this->input->post('nim'),
            'nama_mahasiswa' => $this->input->post('nama_mahasiswa'),
            'jenis_kelamin' => $this->input->post('jenis_kelamin'),
            'alamat' => $this->input->post('alamat'),
            'nomer_hp' => $this->input->post('nomer_hp')
        );
        return $this->db->insert('mahasiswa',$data);
    }

    public function edit_data(){
        $data = array(
            'id_mahasiswa' => $this->input->post('id_mahasiswa'),
            'nim' => $this->input->post('nim'),
            'nama_mahasiswa' => $this->input->post('nama_mahasiswa'),
            'jenis_kelamin' => $this->input->post('jenis_kelamin'),
            'alamat' => $this->input->post('alamat'),
            'nomer_hp' => $this->input->post('nomer_hp')
        );
        $id_mahasiswa = $this->input->post('id_mahasiswa');
        $this->db->where('id_mahasiswa', $id_mahasiswa);
        return $this->db->update('mahasiswa',$data);
    }

    public function hapus($id_mahasiswa){
        return $this->db->delete('mahasiswa',array('id_mahasiswa' =>$id_mahasiswa));
    }
    function banyak(){
        $hasil = "SELECT count(nim) as banyak FROM mahasiswa";
        $tampil = $this->db->query($hasil);
        return $tampil->row()->banyak;
    }
    function merubah(){
        $hasil = "SELECT count(id_mahasiswa) as banyak FROM log";
        $tampil = $this->db->query($hasil);
        return $tampil->row()->banyak;
    }
    public function tampillog(){
        $query = $this->db->get('log');
        return $query->result_array();
    }
}