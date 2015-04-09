From: Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v5] DT: leds: Improve description of flash LEDs
 related properties
Date: Thu, 09 Apr 2015 11:03:19 +0300
Message-ID: <55263247.5070009@linux.intel.com>
References: <1428503487-4912-1-git-send-email-j.anaszewski@samsung.com> <552545FF.2030208@samsung.com> <552628E4.50003@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:37053 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751767AbbDIID6 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
	Thu, 9 Apr 2015 04:03:58 -0400
In-Reply-To: <552628E4.50003@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-leds@vger.kernel.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org

Hi Jacek and Sylwester,

Jacek Anaszewski wrote:
> On 04/08/2015 05:15 PM, Sylwester Nawrocki wrote:
>> On 08/04/15 16:31, Jacek Anaszewski wrote:
>>> Properties defining maximum values for LED currents and timeout should
>>> be mandatory to avoid the risk of hardware damage. This patch fixes
>>> the issue.
>>>
>>> Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
>>> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
>>
>>> ---
>>>   Documentation/devicetree/bindings/leds/common.txt |   19
>>> +++++++++++--------
>>>   1 file changed, 11 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/leds/common.txt
>>> b/Documentation/devicetree/bindings/leds/common.txt
>>> index 747c538..e478ac6 100644
>>> --- a/Documentation/devicetree/bindings/leds/common.txt
>>> +++ b/Documentation/devicetree/bindings/leds/common.txt
>>> @@ -10,6 +10,17 @@ can influence the way of the LED device
>>> initialization, the LED components
>>>   have to be tightly coupled with the LED device binding. They are
>>> represented
>>>   by child nodes of the parent LED device binding.
>>>
>>> +Required properties for child nodes:
>>
>> These properties are mandatory only for LEDs with Flash/Torch
>> capabilities,
>> aren't they?
> 
> flash-max-microamp and flash-timeout-us properties description mention
> that they refer to flash LEDs. Perhaps this should be made indeed more
> explicit.

Sounds good to me, after all these shouldn't be defined for devices they
don't make sense for. Alternatively, you could add another section for
"required properties for flash LEDs".

> 
>> Requiring those properties for all led nodes would make all
>> current dtses not compliant with the DT binding specification AFAICT.

Some drivers also define these explicitly as optional, the behaviour for
those obviously can't be changed.  This should apply to new drivers
only, and I think documenting the matter in this file would be the best
way to do that.

> 
> I was also worrying about making led-max-microamp required, but others
> didn't share my objections. I think that we have to reexamine this.
> 
> Please refer to the discussion under [PATCH v4]. The role of this
> led-max-microamp property would be preventing hardware damage.
> 
> 
>> How about:
>>
>> "Required properties for child nodes for LEDs with Flash/Torch
>> capabilities:" ?
>>
>>> +- led-max-microamp : Maximum LED supply current in microamperes
>>> +                     (torch LED for flash devices). Controllers that

Do you think we can just rename max-microamp as led-max-microamp? It's
been there since v3.19. Or is it because no driver has been using it?

>>> have no
>>> +                     configurable current can omit this property.
>>> +- flash-max-microamp : Maximum flash LED supply current in
>>> microamperes.
>>> +- flash-timeout-us : Timeout in microseconds after which the flash
>>> +                     LED is turned off.
>>> +
>>
>>> +Above properties determine a LED driver IC settings required for safe
>>> +operation. They should be also used as the initial settings for the IC.
>>
>> Shouldn't "Controllers that have no configurable current can omit this
>> property" refer to both led-max-microamp and flash-max-microamp?
>>
>> I would drop the "Above...for the IC." paragraph and instead add
>> something like:
>>
>> "For controllers that have no configurable current the led-max-microamp,
>> flash-max-microamp properties respectively can be omitted. For
>> controllers that
>> have no configurable timeout the flash-timeout-us property can be
>> omitted."
> 
> Are we going to avoid mentioning about their role in preventing
> hardware damage (former "for safe operation" sequence)?

That'd make it understandable why the properties are mandatory. Sounds
good to me.

-- 
Kind regards,

Sakari Ailus
sakari.ailus@linux.intel.com
