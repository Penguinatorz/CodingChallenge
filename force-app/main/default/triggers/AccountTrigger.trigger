Trigger AccountTrigger on Account (before Insert, before update, before delete, after insert, after update, after delete, after undelete){
    switch on Trigger.operationType{
        when BEFORE_INSERT{

        }
        when BEFORE_UPDATE{

        }
        when BEFORE_DELETE{
            AccountHelper.noDeleteAccountWithContact(Trigger.old);
            

        }
        when AFTER_INSERT{
            AccountHelper.createDummyContact(Trigger.new);
        }
        when AFTER_UPDATE{

        }
        when AFTER_DELETE{

        }
        when AFTER_UNDELETE{

        }
    }
}










/*Trigger AccountTrigger on Account (before Insert, before update, before delete, after insert, after update, after delete, after undelete){
    switch on Trigger.operationType{
        when BEFORE_INSERT{

        }
        when BEFORE_UPDATE{

        }
        when BEFORE_DELETE{

        }
        when AFTER_INSERT{
            AccountHelper.createDummyContact(Trigger.new);
            // Returns a list of the new versions of the sObject records.
            // This sObject list is
            // only available in insert, update, and undelete triggers, 
            // and the TRIGGERED records can only be modified in before triggers.

        }
        when AFTER_UPDATE{

        }
        when AFTER_DELETE{

        }
        when AFTER_UNDELETE{

        }
    }
}*/