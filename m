From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH] led-triggers: allow writing 'default' to sysfs trigger
 attr
Date: Tue, 28 Nov 2017 20:38:51 +0100
Message-ID: <33acbe88-efb0-28b2-cc27-c5a8dafdceb0@gmail.com>
References: <20171128063820.87534-1-craig.mcqueen@innerrange.com>
 <20171128120752.GA14905@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:42325 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752618AbdK1Tjv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 28 Nov 2017 14:39:51 -0500
Received: by mail-wm0-f66.google.com with SMTP id l141so1811158wmg.1
        for <linux-leds@vger.kernel.org>; Tue, 28 Nov 2017 11:39:51 -0800 (PST)
In-Reply-To: <20171128120752.GA14905@amd>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>, Craig McQueen <craig.mcqueen@innerrange.com>
Cc: linux-leds@vger.kernel.org

On 11/28/2017 01:07 PM, Pavel Machek wrote:
> On Tue 2017-11-28 17:38:20, Craig McQueen wrote:
>> It calls led_trigger_set_default() to set the LED to its default
>> trigger.
> 
> This needs corresponding change to documentation, at the very least.

I agree - Documentation/ABI/testing/sysfs-class-led will need an update.

>>  drivers/leds/led-triggers.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
>> index 431123b048a2..f090a7806017 100644
>> --- a/drivers/leds/led-triggers.c
>> +++ b/drivers/leds/led-triggers.c
>> @@ -49,6 +49,11 @@ ssize_t led_trigger_store(struct device *dev, struct device_attribute *attr,
>>  		goto unlock;
>>  	}
>>  
>> +	if (sysfs_streq(buf, "default")) {
>> +		led_trigger_set_default(led_cdev);
>> +		goto unlock;
>> +	}
>> +

In an addition to that I'd extend led_trigger_show() to
list also "default" among available triggers if a LED class
device has its default_trigger property initialized and the
trigger has been registered.

-- 
Best regards,
Jacek Anaszewski
