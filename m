From: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v3 1/2] dt: bindings: lm3692x: Add bindings for lm3692x
 LED driver
Date: Wed, 15 Nov 2017 14:31:33 -0600
Message-ID: <0a78c883-f074-cc19-3c0c-fc05607400e9@ti.com>
References: <20171115194203.13572-1-dmurphy@ti.com>
 <cb5c5a65-d5a0-86a3-36b4-cf06baae9ec4@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cb5c5a65-d5a0-86a3-36b4-cf06baae9ec4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

Jacek

On 11/15/2017 02:15 PM, Jacek Anaszewski wrote:
> Hi Dan,
> 
> Thanks for the patch.
> 
> On 11/15/2017 08:42 PM, Dan Murphy wrote:
>> This adds the devicetree bindings for the LM3692x
>> I2C LED string driver.
>>
>> Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
>> Signed-off-by: Dan Murphy <dmurphy-l0cyMroinI0@public.gmane.org>
>> ---
>>
>> v3 - No changes
>> v2 - No changes - https://patchwork.kernel.org/patch/10056677/
>>
>>  .../devicetree/bindings/leds/leds-lm3692x.txt      | 28 ++++++++++++++++++++++
>>  1 file changed, 28 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3692x.txt
>>
>> diff --git a/Documentation/devicetree/bindings/leds/leds-lm3692x.txt b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
>> new file mode 100644
>> index 000000000000..cfef67bd4100
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
>> @@ -0,0 +1,28 @@
>> +* Texas Instruments - LM3692x Highly Efficient Dual-String White LED Driver
>> +
>> +The LM36922 is an ultra-compact, highly efficient,
>> +two string white-LED driver designed for LCD display
>> +backlighting.
> 
> Shouldn't the driver be targeted for backlight subsystem then?
> 
> Adding backlight maintainers.
> 

Great point!  I was not aware of the backlight subsystem.

Looks like I need to create a back light version as well.

Like the lp8788 did since this can be used as a LED driver beyond display back lighting.

Unless the maintainers don't want it.

Dan


-- 
------------------
Dan Murphy
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
