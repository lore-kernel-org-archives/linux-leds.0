From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [patch v4] leds: add driver for Mellanox systems LEDs
Date: Thu, 08 Sep 2016 12:24:00 +0200
Message-ID: <3fd4a32a-ea79-315a-486f-2dab6aa384d8@samsung.com>
References: <1473319553-37195-1-git-send-email-vadimp@mellanox.com>
 <f1343a15-3553-023f-c492-6364ec79decb@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <f1343a15-3553-023f-c492-6364ec79decb@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: vadimp@mellanox.com, rpurdie@rpsys.net
Cc: dave@treblig.org, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, jiri@resnulli.us, michaelsh@mellanox.com
List-Id: linux-leds@vger.kernel.org

On 09/08/2016 12:20 PM, Jacek Anaszewski wrote:
> On 09/08/2016 09:25 AM, vadimp@mellanox.com wrote:
>> From: Vadim Pasternak <vadimp@mellanox.com>
>
>> diff --git a/Documentation/leds/leds-mlxcpld.txt
>> b/Documentation/leds/leds-mlxcpld.txt
>> new file mode 100644
>> index 0000000..7b4c2a3
>> --- /dev/null
>> +++ b/Documentation/leds/leds-mlxcpld.txt
>> @@ -0,0 +1,110 @@
>> +ver LEDs-mlxcpld
>
> I noticed this only now - is it a stray line or you intended it was
> something more meaningful?

OK, I changed it to:

Kernel driver for Mellanox systems LEDs
=======================================

followed by an empty line.

>> +==========================
>> +Driver for Mellanox systems LEDs.
>> +Provide system LED support for the nex Mellanox systems:
>> +"msx6710", "msx6720", "msb7700", "msn2700", "msx1410",
>> +"msn2410", "msb7800", "msn2740", "msn2100".
>
>


-- 
Best regards,
Jacek Anaszewski
