From: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Subject: Re: [RFC PATCH 2/2] leds: as3645a: Update LED label generation
Date: Thu, 14 Dec 2017 13:13:27 -0600
Message-ID: <59aa1ed6-f61b-08c3-feaa-9bc6d2311745@ti.com>
References: <20171212215024.30116-1-dmurphy@ti.com>
 <20171212215024.30116-2-dmurphy@ti.com>
 <20171214180335.j6qk2rrge77gpbba@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171214180335.j6qk2rrge77gpbba-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Sakari

On 12/14/2017 12:03 PM, Sakari Ailus wrote:
> Hi Dan,
> 
> Thanks for the patchset.
> 
> On Tue, Dec 12, 2017 at 03:50:24PM -0600, Dan Murphy wrote:
>> Generate the LED label based off either the
>> DT label node or off the I2C ID in the
>> i2c device id struct.
>>
>> If the label is used then this should denote
>> the LED function.  As an example it would
>> be as3645a:<function>
>>
>>  Otherwise if the label is not
>> used the LED label will be as3645a:flash and
>> as3645a:indicator.
> 
> Which tree the patch is for? I see "id" is a u32 in what I have, and
> also not defined in this scope.

Ah.  I did not notice that the driver used the probe_new call back.

I will be re-sending anyway since this is a RFC

Dan

> 
>>
>> Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
>> ---
>>  drivers/leds/leds-as3645a.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
>> index f883616d9e60..197acd69ddcc 100644
>> --- a/drivers/leds/leds-as3645a.c
>> +++ b/drivers/leds/leds-as3645a.c
>> @@ -526,10 +526,11 @@ static int as3645a_parse_node(struct as3645a *flash,
>>  
>>  	rval = of_property_read_string(flash->flash_node, "label", &name);
>>  	if (!rval)
>> -		strlcpy(names->flash, name, sizeof(names->flash));
>> +		snprintf(names->flash, sizeof(names->flash), "%s:%s",
>> +			 id->name, name);
>>  	else
>>  		snprintf(names->flash, sizeof(names->flash),
>> -			 "%s:flash", node->name);
>> +			 "%s:flash", id->name);
>>  
>>  	rval = of_property_read_u32(flash->flash_node, "flash-timeout-us",
>>  				    &cfg->flash_timeout_us);
>> @@ -570,10 +571,11 @@ static int as3645a_parse_node(struct as3645a *flash,
>>  
>>  	rval = of_property_read_string(flash->indicator_node, "label", &name);
>>  	if (!rval)
>> -		strlcpy(names->indicator, name, sizeof(names->indicator));
>> +		snprintf(names->indicator, sizeof(names->indicator), "%s:%s",
>> +			 id->name, name);
>>  	else
>>  		snprintf(names->indicator, sizeof(names->indicator),
>> -			 "%s:indicator", node->name);
>> +			 "%s:indicator", id->name);
>>  
>>  	rval = of_property_read_u32(flash->indicator_node, "led-max-microamp",
>>  				    &cfg->indicator_max_ua);
> 
> 
> 


-- 
------------------
Dan Murphy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
