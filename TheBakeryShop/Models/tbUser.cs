﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TheBakeryShop.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public partial class tbUser
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbUser()
        {
            this.tbBills = new HashSet<tbBill>();
        }

        [DisplayName("Mã người dùng")]
        [Required(ErrorMessage = "not empty")]
        public int idUser { get; set; }

        [DisplayName("Tên người dùng")]
        [Required(ErrorMessage = "Không được để trống tên đăng nhập")]
        public string userName { get; set; }

        [DisplayName("Mật khẩu")]
        [Required(ErrorMessage = "Không được để trống mật khẩu")]
        public string userPass { get; set; }

        [NotMapped]
        [DisplayName("Nhập lại mật khẩu")]
        [Required(ErrorMessage = "Không được để trống")]
        [Compare("userPass")]
        public string RePass { get; set; }

        public string codeCus { get; set; }
        
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbBill> tbBills { get; set; }
        public virtual tbCustomer tbCustomer { get; set; }
    }
}
