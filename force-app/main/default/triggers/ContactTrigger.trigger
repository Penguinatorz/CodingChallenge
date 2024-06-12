Trigger ContactTrigger on Contact (before Insert, before update, before delete, after insert, after update, after delete, after undelete){
    switch on Trigger.operationType{
        when BEFORE_INSERT{
            ContactHelper.defaultEmailDomain(Trigger.new);
        }
        when BEFORE_UPDATE{

        }
        when BEFORE_DELETE{

        }
        when AFTER_INSERT{

        }
        when AFTER_UPDATE{
            ContactHelper.updateAccountPhoneField(Trigger.new);
        }
        when AFTER_DELETE{

        }
        when AFTER_UNDELETE{

        }
    }
}