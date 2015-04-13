From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: Re: [patch 2/2 v2] leds: netxbig: silence a static checker warning
Date: Mon, 13 Apr 2015 09:35:19 +0200
Message-ID: <552B71B7.3000100@samsung.com>
References: <20150410083040.GA2189@mwanda> <5527DBBA.9060109@samsung.com>
 <20150410143056.GI16501@mwanda> <20150410144123.GI1509@kw.sim.vm.gnt>
 <20150410155034.GK16501@mwanda> <20150410195224.GJ1509@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <kernel-janitors-owner@vger.kernel.org>
In-reply-to: <20150410195224.GJ1509@kw.sim.vm.gnt>
Sender: kernel-janitors-owner@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 04/10/2015 09:52 PM, Simon Guinot wrote:
> On Fri, Apr 10, 2015 at 06:50:34PM +0300, Dan Carpenter wrote:
>> I've looked at this some more.  Most of the places which call
>> of_property_read_u32_index() check the return code.  The ones that don't
>> mostly initialize their values going in.  The remainder introduce static
>> checker warnings like:
>>
>> 	drivers/clk/ti/divider.c:472 ti_clk_get_div_table()
>> 	error: potentially using uninitialized 'val'.
>>
>> These warnings cause me pain.  It calls of_get_property() earlier so
>> it won't return -EINVAL.  I don't know if it can return -ENODATA or
>> -EOVERFLOW?
>>
>> I guess not.
>
> I think it can't. Above, we are calling of_property_count_u32_elems() to
> count the number of u32 elements in the "timers" property. After we are
> ensuring that there is three u32 elements available per timer. That's
> why the return codes for the three of_property_read_u32_index() calls
> are not checked.

After looking at Documentation/devicetree/bindings/leds/leds-netxbig.txt
I noticed inconsistency: timers property is defined as required, but
the comment over the call to of_property_count_u32_elems says that it
is optional.

I think that DT documentation should be changed to make the property
optional. How do you think?

Besides, I am wondering if we shouldn't check if the values read are
sane? In such a case initializing delay_on and delay_off to 0 would be
useful. We could check if both delays don't equal 0, which could happen
if the of_property_read_u32_index returned negative value because of
providing values out of bounds or not numerical values.

-- 
Best Regards,
Jacek Anaszewski
