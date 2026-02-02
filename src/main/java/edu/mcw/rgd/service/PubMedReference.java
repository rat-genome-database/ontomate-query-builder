package edu.mcw.rgd.service;

import edu.mcw.rgd.dao.impl.AnnotationDAO;
import edu.mcw.rgd.dao.impl.ReferenceDAO;
import edu.mcw.rgd.reporting.Link;

/**
 * Created by jthota on 5/23/2019.
 */
public class PubMedReference {
    ReferenceDAO refDao= new ReferenceDAO();
    AnnotationDAO annDao= new AnnotationDAO();
    public String getReferenceURLByPubMedId(String pmId) throws Exception {

        String url =new String();
        if((!(pmId.equals("")))){
            int refRgdId = refDao.getReferenceRgdIdByPubmedId(pmId);

            int annotcount = annDao.getCountOfAnnotationsByReference(refRgdId);
            if(annotcount>0){
                url=Link.ref(refRgdId)+"&abstract=0";

            }

        }

        return url;
    }
    public int getReferenceRgdId(String pmId) throws Exception {

        String url =new String();
        if((!(pmId.equals("")))){
            int refRgdId = refDao.getReferenceRgdIdByPubmedId(pmId);
            int annotcount = annDao.getCountOfAnnotationsByReference(refRgdId);
            if(annotcount>0){
               return refRgdId;
            }

        }

        return 0;
    }
}
