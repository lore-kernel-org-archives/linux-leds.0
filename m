From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [patch 2/2 v2] leds: netxbig: silence a static checker warning
Date: Mon, 13 Apr 2015 10:25:45 +0200
Message-ID: <552B7D89.2070307@free-electrons.com>
References: <20150410002507.GF1509@kw.sim.vm.gnt> <20150410083040.GA2189@mwanda> <20150410143054.GH1509@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-Reply-To: <20150410143054.GH1509@kw.sim.vm.gnt>
Sender: kernel-janitors-owner@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: linux-leds@vger.kernel.org

Hi Simon, Dan,

On 10/04/2015 16:30, Simon Guinot wrote:
> On Fri, Apr 10, 2015 at 11:30:41AM +0300, Dan Carpenter wrote:
>> Static checkers complain that "timers[i].delay_on" is an unsigned long
>> but we're writing to only 32 bits of it.  The code works on 32 bit
>> systems and little endian 64 bit systems so it doesn't cause a problem
>> in practise but it's still better to silence the warning.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Acked-by: Simon Guinot <simon.guinot@sequanux.org>
> 
> Note that your patch applies on the top of a patch "leds: netxbig: add 
> device tree binding" which has not been merged yet by Bryan. For now,
> this patch only sits in the mvebu/for-next branch for testing purpose.
> And it is still not clear to me in which tree the patch will go. That's
> why I think you should resend your patch to the mvebu maintainers (added
> in Cc) on the LAKML. Probably they will be interested in merging your
> clean-up patch in the mvebu/for-next branch as well.

Actually the reason to get all the series in mvebu/for-next was to be
confident enough to make a pull request as soon as the driver part was
acked by the maintainer. Unfortunately it didn't occur until now and
the merge windows for arm-soc is now closed so it won't be part of
v4.1 (at least the mvebu related part).

Thanks,

Gregory

> 
> Regards,
> 
> Simon
> 
>> ---
>> v2: use a temporary variable
>>
>> diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
>> index 028686f2..6cb4537 100644
>> --- a/drivers/leds/leds-netxbig.c
>> +++ b/drivers/leds/leds-netxbig.c
>> @@ -444,12 +444,17 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
>>  		if (!timers)
>>  			return -ENOMEM;
>>  		for (i = 0; i < num_timers; i++) {
>> +			u32 delay_on = 0;
>> +			u32 delay_off = 0;
>> +
>>  			of_property_read_u32_index(np, "timers", 3 * i,
>>  						&timers[i].mode);
>>  			of_property_read_u32_index(np, "timers", 3 * i + 1,
>> -						(u32 *) &timers[i].delay_on);
>> +						   &delay_on);
>>  			of_property_read_u32_index(np, "timers", 3 * i + 2,
>> -						(u32 *) &timers[i].delay_off);
>> +						   &delay_off);
>> +			timers[i].delay_on = delay_on;
>> +			timers[i].delay_off = delay_off;
>>  		}
>>  		pdata->timer = timers;
>>  		pdata->num_timer = num_timers;


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
