//------------------------------------------------------------------------------
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
    
    public partial class tbCustomer
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbCustomer()
        {
            this.tbUsers = new HashSet<tbUser>();
        }
    
        public string codeCus { get; set; }
        public string nameCus { get; set; }
        public string addressCus { get; set; }
        public string phoneCus { get; set; }
        public string emailCus { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbUser> tbUsers { get; set; }
    }
}
