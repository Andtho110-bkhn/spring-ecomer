package vn.t3h.model;

import java.io.Serializable;
import java.math.BigInteger;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedNativeQueries;
import javax.persistence.NamedNativeQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import org.hibernate.annotations.Proxy;

@NamedNativeQueries({
    @NamedNativeQuery(
        name = "findAllPermision",
        query = "select `id`,`roles`,`action` from `user_permision` ORDER BY `action` ASC"
    )
})
@Table(name = "user_permision")
@Proxy(lazy = false)
@javax.persistence.Entity(name = "UserPermision")
public class UserPermision implements Serializable {

	private static final long serialVersionUID = 7596003160619110507L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private BigInteger id;

    @NotEmpty
    @Column(name = "\"roles\"", nullable = false)
    private String roles;

    @NotEmpty
    @Column(name = "\"action\"", nullable = false)
    private String action;

    public BigInteger getId() {
        return id;
    }

    public void setId(BigInteger id) {
        this.id = id;
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }
    
    @Override
    public String toString() {
        return "id:" + id + "|roles:" + roles + "|action:" + action; 
    }
}
