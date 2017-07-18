From: Jacek Anaszewski <jacek.anaszewski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 3/3] DT: leds: Add Qualcomm Light Pulse Generator
 binding
Date: Tue, 18 Jul 2017 23:38:38 +0200
Message-ID: <450665a7-637a-e90c-aef4-3421f1f45788@gmail.com>
References: <20170714224520.467-1-bjorn.andersson@linaro.org>
 <20170714224520.467-4-bjorn.andersson@linaro.org>
 <aefc36fc-9c16-e8da-b684-6e77ec96c662@gmail.com>
 <20170717044430.GW1618@tuxbook>
 <8c5d2d85-24ac-2ff9-8512-f669063edf4c@gmail.com>
 <20170718000314.GC20973@minitux>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170718000314.GC20973@minitux>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Fenglin Wu <fenglinw-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On 07/18/2017 02:03 AM, Bjorn Andersson wrote:
> On Mon 17 Jul 14:08 PDT 2017, Jacek Anaszewski wrote:
> 
>> On 07/17/2017 06:44 AM, Bjorn Andersson wrote:
>>> On Sun 16 Jul 11:49 PDT 2017, Jacek Anaszewski wrote:
>>>> On 07/15/2017 12:45 AM, Bjorn Andersson wrote:
>>>>> diff --git a/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
>>>>> new file mode 100644
>>>>> index 000000000000..cc9ffee6586b
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/leds/leds-qcom-lpg.txt
>>>>> @@ -0,0 +1,145 @@
>>>>> +Binding for Qualcomm Light Pulse Generator
>>>>> +
>>>>> +The Qualcomm Light Pulse Generator consists of three different hardware blocks;
>>>>
>>>> Is there a freely available documentation thereof?
>>>>
>>>
>>> The only publicly available Qualcomm PMIC documentation that I'm aware
>>> of only have the PWM hardware block, so it will be possible to use this
>>> driver but with limited functionality.
>>
>> I asked because having an access to the doc would speed up the
>> contribution process a lot I think. Of course we will manage to make it
>> also basing on the details you're providing us with, but it will take
>> a bit longer, taking into account the device complexity.
>>
> 
> I agree that it would be convenient. Please do let me know if there are
> any parts that are unclear and I'll try to explain things further.

I'd be especially interested in possible topologies of routing between
pattern generator units and TRILEDs.

>>> [..]
>>>>> += Light Pulse Generator (LPG)
>>>>> +The Light Pulse Generator can operate either as a standard PWM controller or in
>>>>> +a more advanced lookup-table based mode. These are described separately below.
>>>>
>>>> Why a user would prefer one option over the other? I assume that both
>>>> controllers offer at least slightly different capabilities.
>>>> If so, then it could be the driver which would decide which one fits
>>>> better for the requested LED class device configuration.
>>>>
>>>
>>> I have never seen this hardware block been used as a PWM, but I imagine
>>> it to be used when someone has another driver that expects to be able to
>>> use the PWM API to control an output.
>>
>> We have already leds-pwm driver and related DT bindings. We could think
>> of making some part of leds-pwm code reusable. I'd skip it for now
>> though.
>>
> 
> I know of a few different attempts where people have tried to start off
> with a PWM driver and leds-pwm and then extend that to support patterns.
> 
>>From this I concluded that any LED use cases better be implemented in
> this way, but still offer the system designer to use the hardware block
> as a PWM source - if any other device drivers/use cases expects a PWM
> source.

Frankly speaking leds-pwm driver provides quite generic interface for
driving pwm devices. This use case is even advertised in the first place
in Documentation/pwm.txt. LED subsystem is already used for non-LED
specific purposes like vibrate hardware control
(see Documentation/leds/ledtrig-transient.txt). In effect I don't
see any specific gain in exposing generic pwm device instead
of the LED class one.

>>> In this case the node would need a #pwm-cells property, which it doesn't
>>> when it's acting as a LED and it wouldn't make much sense to expose the
>>> pin as a LED at the same time.
>>>
>>> Perhaps I overthought this? Maybe I should just leave the PWM mode out
>>> for now and it could be added in the future?
>>
>> Sounds reasonable.
>>
>>> [..]
>>>>> +&spmi_bus {
>>>>> +	pmic@3 {
>>>>> +		compatible = "qcom,pmi8994", "qcom,spmi-pmic";
>>>>> +		reg = <0x3 SPMI_USID>;
>>>>> +		#address-cells = <1>;
>>>>> +		#size-cells = <0>;
>>>>> +
>>>>> +		pmi8994_lpg_lut: lpg-lut@b000 {
>>>>> +			compatible = "qcom,spmi-lpg-lut";
>>>>> +			reg = <0xb000>;
>>>>> +
>>>>> +			qcom,lut-size = <24>;
>>>>> +		};
>>>>> +
>>>>> +		lpg@b200 {
>>>>> +			compatible = "qcom,spmi-lpg";
>>>>> +			reg = <0xb200>;
>>>>> +
>>>>> +			cell-index = <2>;
>>>>> +
>>>>> +			label = "lpg:green:user0";
>>>>> +
>>>>> +			qcom,tri-led = <&pmi8994_tri_led 1>;
>>>>> +			qcom,lut = <&pmi8994_lpg_lut>;
>>>>> +
>>>>> +			default-state = "on";
>>>>> +		};
>>>>> +
>>>>> +		pmi8994_tri_led: tri-led@d000 {
>>>>> +			compatible = "qcom,spmi-tri-led";
>>>>> +			reg = <0xd000>;
>>>>> +
>>>>> +			qcom,power-source = <1>;
>>>>> +		};
>>>>
>>>> Such a design is uncommon for LED class DT bindings. It should
>>>> suffice to have a single DT LED node per LED. I have an impression
>>>> that you're exposing too many hardware details here.
>>>> You can use led-sources property (see Documentation/devicetree/bindings
>>>> /leds/common.txt and drivers/leds/leds-max77693.c where it is used).
>>>>
>>>
>>> The LUT is shared among the (up to) 8 LPG blocks, so while I did
>>> consider just including the LUT in each LPG block it didn't look nice
>>> and I had to implement the LUT as a singleton in the driver itself.
>>>
>>> The TRILED is only one of the available current sinks in the PMIC that
>>> can be driven by the LPG; the other one I use so far is a special GPIO
>>> pin acting as a current sink.
>>>
>>> Also the power-source configuration is shared among the three channels
>>> of the TRILED, so it doesn't really make sense to put this configuration
>>> in the LPG blocks themselves.
>>
>> I'll mention led-sources once again. Probably it could be of help here.
>>
> 
> I wasn't aware of the led-sources, thanks for highlighting it (once more).
> 
> Perhaps if we go with your suggested redesign of having a single node
> for all LPG related parts the led-sources would be used for some of
> those channels to tie them to the TRILED...
> 
>>>
>>> And note that these are different blocks within the Qualcomm PMIC, with
>>> my design only one of them is actually representing the LED instance.
>>
>> Maybe the core of the driver should be placed in MFD subsystem then?
>>
> 
> If we're to move things around I would say the current sink (TRILED)
> should go elsewhere, and we should hide the LUT somewhere (although it's
> very much tied to the LPG block) and then keep the LPG as "the LED
> driver".
> 
> The overarching PMIC driver is already a MFD, so I don't think it makes
> sense to group some of the MFD children into a new MFD.

Now I'm starting to wonder if it wouldn't make sense to create
a pattern trigger that would handle this type of patterns. Something
similar to ledtrig-timer but it would expose pattern sysfs file similar
to delay_on/delay_off. In case given LED class device isn't
routed to the suitable pattern generator the software fallback would
be applied.

>>>> It is also not clear to me why single green color LED presented here
>>>> would have to use tri-led sink? I suppose that the sink is predestined
>>>> for three-color LEDs.
>>>>
>>>
>>> The board I'm working on (DragonBoard820c) has 4 green LEDs, the first 3
>>> are connected to the 3 channels of the TRILED and the fourth is
>>> connected to a special GPIO in current sink mode. But I choose to
>>> shorted the example to one channel.
>>>
>>> So I end up having one LUT node, four LPG nodes, one TRILED and one GPIO
>>> node and the user space is presented with a unified interface to all
>>> four.
>>
>> Generally I'd prefer to have a single LED class driver for this device,
>> or alternatively a LED class driver for a LED cell of MFD device.
>> DT bindings would define which hw blocks are LED related.
>> All routing related issues should be solvable with use of led-sources
>> property.
>>
> 
> Based on the fact that I'm writing a driver for a MFD child block and
> there can be 1-8 instances of the hardware block, we got a pretty nice
> representation of the hardware in DT.  But for e.g. GPIOs we do have a
> single driver instance for multiple blocks, so it wouldn't be the only
> case.

Please keep in mind that for registering gpio LED class device you have
gpio_led_register_device() API (drivers/leds/leds-gpio-register.c) for
your disposal.

> The DeviceTree would in this case be a single node covering the N LPG
> blocks, the TRILED and the LUT and would have to have N child nodes to
> express the properties of each channel. The driver would register a
> led_cdev for each of the channels.
> 
> 
> My initial concern with this approach is that we have a variable number
> of LPG blocks and the LUT and TRILED blocks are not found in all PMICs.
> But if we are allowed to rely on "reg-names" we would be fine and it
> would reduce the complexity of tying the multiple devices together a
> bit.

I propose to have a main DT node for the whole device, which would
contain all required hardware resources and the child DT nodes
describing LED class devices to create. The child nodes could contain
led-sources property if necessary. In the main node you could have an
array of LPG and LUT base addresses.

-- 
Best regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
