From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v5] DT: leds: Improve description of flash LEDs related
 properties
Date: Thu, 09 Apr 2015 11:45:48 +0200
Message-ID: <55264A4C.6070509@samsung.com>
References: <1428503487-4912-1-git-send-email-j.anaszewski@samsung.com>
 <552545FF.2030208@samsung.com> <552628E4.50003@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:17626 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934202AbbDIJpx (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Thu, 9 Apr 2015 05:45:53 -0400
In-reply-to: <552628E4.50003@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: linux-leds@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, Sakari Ailus <sakari.ailus@linux.intel.com>, devicetree@vger.kernel.org

On 09/04/15 09:23, Jacek Anaszewski wrote:
> On 04/08/2015 05:15 PM, Sylwester Nawrocki wrote:
>> > On 08/04/15 16:31, Jacek Anaszewski wrote:
>>> >> Properties defining maximum values for LED currents and timeout should
>>> >> be mandatory to avoid the risk of hardware damage. This patch fixes
>>> >> the issue.

>>> >> --- a/Documentation/devicetree/bindings/leds/common.txt
>>> >> +++ b/Documentation/devicetree/bindings/leds/common.txt
>>> >> @@ -10,6 +10,17 @@ can influence the way of the LED device initialization, the LED components
>>> >>   have to be tightly coupled with the LED device binding. They are represented
>>> >>   by child nodes of the parent LED device binding.
>>> >>
>>> >> +Required properties for child nodes:
>> >
>> > These properties are mandatory only for LEDs with Flash/Torch capabilities,
>> > aren't they?
>
> flash-max-microamp and flash-timeout-us properties description mention
> that they refer to flash LEDs. Perhaps this should be made indeed more
> explicit.

I understood it as if we wanted to make those 3 new properties mandatory
for all LEDs. I think it's better to make it explicit to avoid confusion.

>  > Requiring those properties for all led nodes would make all
>> > current dtses not compliant with the DT binding specification AFAICT.
>
> I was also worrying about making led-max-microamp required, but others
> didn't share my objections. I think that we have to reexamine this.
> 
> Please refer to the discussion under [PATCH v4]. The role of this
> led-max-microamp property would be preventing hardware damage.

Well, we can't simply add such a required property now to all led device
nodes. It would cause dtb/kernel compatibility issues. So far
led-max-microamp was not required for simple LEDs, why would we have to
add it now?

>> > How about:
>> >
>> > "Required properties for child nodes for LEDs with Flash/Torch capabilities:" ?
>> >
>>> >> +- led-max-microamp : Maximum LED supply current in microamperes
>>> >> +                     (torch LED for flash devices). Controllers that have no
>>> >> +                     configurable current can omit this property.
>>> >> +- flash-max-microamp : Maximum flash LED supply current in microamperes.
>>> >> +- flash-timeout-us : Timeout in microseconds after which the flash
>>> >> +                     LED is turned off.
>>> >> +
>> >
>>> >> +Above properties determine a LED driver IC settings required for safe
>>> >> +operation. They should be also used as the initial settings for the IC.
>> >
>> > Shouldn't "Controllers that have no configurable current can omit this
>> > property" refer to both led-max-microamp and flash-max-microamp?
>  >
>> > I would drop the "Above...for the IC." paragraph and instead add something like:
>> >
>> > "For controllers that have no configurable current the led-max-microamp,
>> > flash-max-microamp properties respectively can be omitted. For controllers that
>> > have no configurable timeout the flash-timeout-us property can be omitted."
>
> Are we going to avoid mentioning about their role in preventing
> hardware damage (former "for safe operation" sequence)?

I don't have strong opinion, up to you. I'd say this additional note is
not needed when we explained those properties specify limits for controllers
with configurable current.

--
Regards,
Sylwester
