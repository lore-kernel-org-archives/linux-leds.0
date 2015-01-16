From: Jacek Anaszewski <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH/RFC v10 03/19] DT: leds: Add led-sources property
Date: Fri, 16 Jan 2015 16:52:48 +0100
Message-ID: <54B933D0.1090004@samsung.com>
References: <1420816989-1808-1-git-send-email-j.anaszewski@samsung.com>
 <1420816989-1808-4-git-send-email-j.anaszewski@samsung.com>
 <CAL_JsqJKEp6TWaRhJimg3AWBh+MCCr2Bk9+1o7orLLdp5E+n-g@mail.gmail.com>
 <54B38682.5080605@samsung.com>
 <CAL_Jsq+UaA41DvawdOMmOib=Fi0hC-nBdKV-+P4DFo+MoOy-bQ@mail.gmail.com>
 <54B3F1EF.4060506@samsung.com>
 <CAL_JsqKpJtUG0G6g1GOuSVpc31oe-dp3qdrKJUE0upG-xRDFhA@mail.gmail.com>
 <54B4DA81.7060900@samsung.com>
 <CAL_JsqLYxB5hzLAWXpU=uncM5DEMZU78mP673H9oSSNB-cgcYQ@mail.gmail.com>
 <54B8D4D0.3000904@samsung.com>
 <CAL_Jsq+EFWzs1HP1tVt6P=p=HZn2AtSPjp55YrmMQi_mE+kNfQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <CAL_Jsq+EFWzs1HP1tVt6P=p=HZn2AtSPjp55YrmMQi_mE+kNfQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, sakari.ailus-X3B1VOXEql0@public.gmane.org, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-leds@vger.kernel.org

On 01/16/2015 02:48 PM, Rob Herring wrote:
> On Fri, Jan 16, 2015 at 3:07 AM, Jacek Anaszewski
> <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>> On 01/15/2015 03:24 PM, Rob Herring wrote:
>>>
>>> On Tue, Jan 13, 2015 at 2:42 AM, Jacek Anaszewski
>>> <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>>>
>>>> On 01/12/2015 05:55 PM, Rob Herring wrote:
>>>>>
>>>>>
>>>>> Adding Mark B and Liam...
>>>>>
>>>>> On Mon, Jan 12, 2015 at 10:10 AM, Jacek Anaszewski
>>>>> <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>>>>>
>>>>>>
>>>>>> On 01/12/2015 02:52 PM, Rob Herring wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On Mon, Jan 12, 2015 at 2:32 AM, Jacek Anaszewski
>>>>>>> <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 01/09/2015 07:33 PM, Rob Herring wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On Fri, Jan 9, 2015 at 9:22 AM, Jacek Anaszewski
>>>>>>>>> <j.anaszewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Add a property for defining the device outputs the LED
>>>>>>>>>> represented by the DT child node is connected to.
>>>>>
>>>>>
>>>>>
>>>>> [...]
>>>>>
>>>>>>>>>> b/Documentation/devicetree/bindings/leds/common.txt
>>>>>>>>>> index a2c3f7a..29295bf 100644
>>>>>>>>>> --- a/Documentation/devicetree/bindings/leds/common.txt
>>>>>>>>>> +++ b/Documentation/devicetree/bindings/leds/common.txt
>>>>>>>>>> @@ -1,6 +1,10 @@
>>>>>>>>>>       Common leds properties.
>>>>>>>>>>
>>>>>>>>>>       Optional properties for child nodes:
>>>>>>>>>> +- led-sources : Array of bits signifying the LED current regulator
>>>>>>>>>> outputs the
>>>>>>>>>> +               LED represented by the child node is connected to
>>>>>>>>>> (1
>>>>>>>>>> -
>>>>>>>>>> the LED
>>>>>>>>>> +               is connected to the output, 0 - the LED isn't
>>>>>>>>>> connected
>>>>>>>>>> to the
>>>>>>>>>> +               output).
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> Sorry, I just don't understand this.
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> In some Flash LED devices one LED can be connected to one or more
>>>>>>>> electric current outputs, which allows for multiplying the maximum
>>>>>>>> current allowed for the LED. Each sub-LED is represented by a child
>>>>>>>> node in the DT binding of the Flash LED device and it needs to
>>>>>>>> declare
>>>>>>>> which outputs it is connected to. In the example below the
>>>>>>>> led-sources
>>>>>>>> property is a two element array, which means that the flash LED
>>>>>>>> device
>>>>>>>> has two current outputs, and the bits signify if the LED is connected
>>>>>>>> to the output.
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Sounds like a regulator for which we already have bindings for and we
>>>>>>> have a driver for regulator based LEDs (but no binding for it).
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> Do you think of drivers/leds/leds-regulator.c driver? This driver just
>>>>>> allows for registering an arbitrary regulator device as a LED subsystem
>>>>>> device.
>>>>>>
>>>>>> There are however devices that don't fall into this category, i.e. they
>>>>>> have many outputs, that can be connected to a single LED or to many
>>>>>> LEDs
>>>>>> and the driver has to know what is the actual arrangement.
>>>>>
>>>>>
>>>>>
>>>>> We may need to extend the regulator binding slightly and allow for
>>>>> multiple phandles on a supply property, but wouldn't something like
>>>>> this work:
>>>>>
>>>>> led-supply = <&led-reg0>, <&led-reg1>, <&led-reg2>, <&led-reg3>;
>>>>>
>>>>> The shared source is already supported by the regulator binding.
>>>>
>>>>
>>>>
>>>> I think that we shouldn't split the LED devices into power supply
>>>> providers and consumers as in case of generic regulators. From this
>>>> point of view a LED device current output is a provider and a discrete
>>>> LED element is a consumer. In this approach each discrete LED element
>>>> should have a related driver which is not how LED devices are being
>>>> handled in the LED subsystem, where there is a single binding for a LED
>>>> device and there is a single driver for it which creates separate LED
>>>> class devices for each LED connected to the LED device output. Each
>>>> discrete LED is represented by a child node in the LED device binding.
>>>>
>>>> I am aware that it may be tempting to treat LED devices as common
>>>> regulators, but they have their specific features which gave a
>>>> reason for introducing LED class for them. Besides, there is already
>>>> drivers/leds/leds-regulator.c driver for LED devices which support only
>>>> turning on/off and setting brightness level.
>>>>
>>>> In your proposition a separate regulator provider binding would have
>>>> to be created for each current output and a separate binding for
>>>> each discrete LED connected to the LED device. It would create
>>>> unnecessary noise in a dts file.
>>>>
>>>> Moreover, using regulator binding implies that we want to treat it
>>>> as a sheer power supply for our device (which would be a discrete LED
>>>> element in this case), whereas LED devices provide more features like
>>>> blinking pattern and for flash LED devices - flash timeout, external
>>>> strobe and flash faults.
>>>
>>>
>>> Okay, fair enough. Please include some of this explanation in the
>>> binding description.
>>>
>>> I do still have some concerns about led-sources and whether it can
>>> support other scenarios. It is very much tied to the parent node. Are
>>> there any cases where we don't want the LEDs to be sub nodes? Perhaps
>>> the LEDs are on a separate daughterboard from the driver/supply and we
>>> can have different drivers. It's a stretch maybe.
>>
>>
>> I think it is. Such arrangements would introduce problems also to the
>> other existing bindings. Probably not only LED subsystem related ones.
>>
>>> Or are there cases
>>> where you need more information than just the connection?
>>
>>
>> Currently I can't think of any.
>>
>> Modified rough proposal of the description:
>>
>>
>> -Optional properties for child nodes:
>> +LED and flash LED devices provide the same basic functionality as
>> +current regulators, but extended with LED and flash LED specific +features
>> like blinking patterns, flash timeout, flash faults and
>> +external flash strobe mode.
>> +
>> +Many LED devices expose more than one current output that can be
>> +connected to one or more discrete LED component. Since the arrangement
>> +of connections can influence the way of the LED device initialization,
>> +the LED components have to be tightly coupled with the LED device
>> +binding. They are represented in the form of its child nodes.
>> +
>> +Optional properties for child nodes (if a LED device exposes only one
>> +current output the properties can be placed directly in the LED device
>> +node):
>
> Why special case 1 output case? Just always require a child node.

OK.

>> +- led-sources : Array of connection states between all LED current
>> +               sources exposed by the device and this LED (1 - this LED
>> +               is connected to the current output with index N, 0 -
>> +               this LED isn't connected to the current output with
>> +               index N); the mapping of N-th element of the array to
>> +               the physical device output should be defined in the LED
>> +               driver binding.
>
> I think this should be a list of connected output numbers rather than
> effectively a bitmask.
>
> You may want to add something like led-output-cnt or led-driver-cnt in
> the parent so you know the max list size.

Why should we need this? The number of current outputs exposed by the
device is fixed and can be specified in a LED device bindings
documentation.

-- 
Best Regards,
Jacek Anaszewski
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
