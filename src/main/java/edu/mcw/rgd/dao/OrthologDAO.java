package edu.mcw.rgd.dao;

import edu.mcw.rgd.dao.spring.OrthologQuery;
import edu.mcw.rgd.datamodel.Ortholog;

import java.util.List;
/*
This class can be deleted once the server upgrades to java 17 and upgraded core is used.
 */
public class OrthologDAO extends AbstractDAO{
    public List<Ortholog> getOrthologsForSourceRgdId(int rgdId) throws Exception {

        String sql = "SELECT o.*,s.species_type_key src_species_type_key,d.species_type_key dest_species_type_key \n" +
                "FROM genetogene_rgd_id_rlt o, rgd_ids s,rgd_ids d \n" +
                "WHERE o.src_rgd_id=s.rgd_id AND o.dest_rgd_id=d.rgd_id AND o.src_rgd_id=? AND s.object_status='ACTIVE' AND d.object_status='ACTIVE'";

        return executeOrthologQuery(sql, rgdId);
    }
    public List<Ortholog> executeOrthologQuery(String query, Object... params) throws Exception {
        OrthologQuery q = new OrthologQuery(this.getDataSource(), query);
        return execute(q, params);
    }
}
