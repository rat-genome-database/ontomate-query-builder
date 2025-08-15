package edu.mcw.rgd.dao;

import edu.mcw.rgd.datamodel.Ortholog;
import org.springframework.jdbc.object.MappingSqlQuery;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;

/*
This class can be deleted once the server upgrades to java 17 and upgraded core is used.
 */
public class OrthologQuery extends MappingSqlQuery {

    public OrthologQuery(DataSource ds, String query) {
        super(ds, query);
    }

    protected Object mapRow(ResultSet rs, int rowNum) throws SQLException {

        Ortholog obj = new Ortholog();

        obj.setKey(rs.getInt("genetogene_key"));
        obj.setSrcRgdId(rs.getInt("src_rgd_id"));
        obj.setDestRgdId(rs.getInt("dest_rgd_id"));
        obj.setGroupId(rs.getInt("group_id"));
        if( rs.wasNull() )
            obj.setGroupId(null);
        obj.setXrefDataSet(rs.getString("xref_data_set"));
        obj.setXrefDataSrc(rs.getString("xref_data_src"));
        obj.setOrthologTypeKey(rs.getInt("ortholog_type_key"));
        obj.setPercentHomology(rs.getDouble("percent_homology"));
        if( rs.wasNull() )
            obj.setPercentHomology(null);
        obj.setCreatedBy(rs.getInt("created_by"));
        obj.setCreatedDate(rs.getTimestamp("created_date"));
        obj.setLastModifiedBy(rs.getInt("last_modified_by"));
        obj.setLastModifiedDate(rs.getTimestamp("last_modified_date"));

        try {
            obj.setSrcSpeciesTypeKey(rs.getInt("src_species_type_key"));
        } catch(Exception ignore) {
            obj.setSrcSpeciesTypeKey(0);
        }
        try {
            obj.setDestSpeciesTypeKey(rs.getInt("dest_species_type_key"));
        } catch(Exception ignore) {
            obj.setDestSpeciesTypeKey(0);
        }
        return obj;
    }
}

