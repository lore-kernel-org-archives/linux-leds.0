From: "Rafael J. Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH v7 1/1] leds: LED driver for TI LP3952 6-Channel Color LED
Date: Tue, 5 Jul 2016 14:12:28 +0200
Message-ID: <CAJZ5v0iDD4WbnrENEdO+4qjOe2_db1-8W0yJePUmeVB57bCkzg@mail.gmail.com>
References: <1467129919-27641-1-git-send-email-tony.makkiel@daqri.com>
 <3435169.nmqvdouPPq@vostro.rjw.lan> <57737021.1010603@samsung.com>
 <57739DCE.3030303@daqri.com> <5773A8CF.10508@samsung.com> <577B9038.1040304@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <577B9038.1040304@samsung.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Tony <tony.makkiel@daqri.com>, linux-leds@vger.kernel.org, rpurdie@rpsys.net, Len Brown <lenb@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Tue, Jul 5, 2016 at 12:47 PM, Jacek Anaszewski
<j.anaszewski@samsung.com> wrote:
> PING
>
>
> On 06/29/2016 12:54 PM, Jacek Anaszewski wrote:
>>
>> On 06/29/2016 12:07 PM, Tony wrote:
>>>
>>>
>>> On 29/06/16 07:52, Jacek Anaszewski wrote:
>>>>
>>>> Hi Rafael,
>>>
>>>
>>>>>> +#ifdef CONFIG_ACPI
>>>>>> +static const struct acpi_device_id lp3952_acpi_match[] = {
>>>>>> +    {LP3952_ACPI_NAME, 0},
>>>>>
>>>>>
>>>>> No, you can't use "PRP0001" in this list.
>>>>>
>>>>>> +    {}
>>>>>> +};
>>>>>> +
>>>>>> +MODULE_DEVICE_TABLE(acpi, lp3952_acpi_match);
>>>>>
>>>>>
>>>>> And you don't need this for the "PRP0001" thing to work.  The core will
>>>>> take care of it for you then.
>>>>>
>>>>>> +#endif
>>>>>
>>>>>
>>>>> So the entire ACPI block can be dropped for now.
>>>>>
>>>>> And the driver doesn't have to depend on CONFIG_ACPI any more, does it?
>>>>
>>>>
>>>> The driver currently supports probing only with ACPI.
>>>> I have one question BTW: isn't there anything similar to the device tree
>>>> bindings documentation required for ACPI overlays?
>>>> Pointer to the discussion which led us to this solution:
>>>>
>>>> http://www.spinics.net/lists/linux-leds/msg06230.html
>>>>
>>> _DSD is working now. I managed to get "PRP0001" working as suggested by
>>> Rafael in
>>> http://marc.info/?l=linux-acpi&m=146711623115228&w=2
>>> with _DSD
>>
>>
>> Thanks for the link.
>>
>> Rafael, "Package" entries seem to mimic Device Tree properties defined
>> in the common leds bindings. Would it be possible to make it even
>> more compatible and define every LED connected to the LED controller
>> in the form of a child node, similarly as in case of LED DT bindings?
>>
>> See Documentation/devicetree/bindings/leds/common.txt and other
>> bindings in Documentation/devicetree/bindings/leds.

I'm not sure what you mean.

If somebody decides to arrange the data in their ACPI tables to follow
that scheme, it will just work IMO.

Is there anything more that needs to be done in the kernel here?

Thanks,
Rafael
