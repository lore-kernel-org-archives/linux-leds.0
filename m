From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2 2/4] platform: x86: dell-smbios: Add a generic
 dell-smbios notifier chain
Date: Thu, 27 Oct 2016 14:54:54 +0200
Message-ID: <2c3f5791-e425-e62d-5d93-426a8624ca4b@redhat.com>
References: <20161023194652.24335-1-hdegoede@redhat.com>
 <20161023194652.24335-2-hdegoede@redhat.com> <20161024133105.GC12154@pali>
 <4cdb7bb1-2b16-e009-3309-433b1a306d54@redhat.com>
 <20161024134339.GE12154@pali>
 <762cceac-d807-0c3d-7469-267cc850f874@redhat.com>
 <20161027103209.GR12154@pali>
 <a34c5fa0-509e-f65f-7c5a-10beb724a6fc@redhat.com>
 <20161027125148.GV12154@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20161027125148.GV12154@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Matthew Garrett <mjg59@srcf.ucam.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 27-10-16 14:51, Pali Rohár wrote:
> On Thursday 27 October 2016 14:45:20 Hans de Goede wrote:
>> HI,
>>
>> On 27-10-16 12:32, Pali Rohár wrote:
>>> On Monday 24 October 2016 15:45:02 Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 24-10-16 15:43, Pali Rohár wrote:
>>>>> On Monday 24 October 2016 15:37:31 Hans de Goede wrote:
>>>>>> Well WMI events get enabled via a SMBIOS call,
>>>>>
>>>>> This is truth only for few laptops and only for one WMI event.
>>>>> Everything else is automatically enabled, no call is needed to issue.
>>>>>
>>>>>> and dell-laptop uses SMBIOS exclusively
>>>>>
>>>>> IIRC dell-led.ko uses also dell-smbio.ko, so it is not exclusive for
>>>>> dell-laptop.
>>>>>
>>>>>> so it seems to fit. Basically this is a case of
>>>>>> we have to put this somewhere and dell-smbios is the best fit IMHO.
>>>>>
>>>>> Agree, we need to put it somewhere...
>>>>>
>>>>> Basically we need to solve problem how (currently) 3 kernel modules can
>>>>> communicate. Does not kernel support such "bus/event" mechanism for
>>>>> this?
>>>>
>>>> Yes it does, that is exactly what notifiers are for, but we need to
>>>> declare the bus somewhere. I still believe dell-smbios is the best
>>>> place.
>>>
>>> But dell_smbios_register_notifier() name is totally confusing. It does
>>> not register any notifier for SMBIOS. Nor it have nothing common with
>>> SMBIOS API.
>>>
>>> Also there is absolutely no need that dell-rbtn.ko needs to depends on
>>> dell-smbios.ko. dell-rbtn.ko is ACPI driver which does not use any of
>>> SMBIOS API.
>>>
>>> Right now I'm not saying what is the best place for that notifier (as I
>>> still do not have ideal candidate). I'm just saying that notifier is not
>>> part of SMBIOS API and therefore dell-smbios.ko is not right place for
>>> it.
>>>
>>> So currently we have these different APIs for dell notebook drivers:
>>> * ACPI (used in dell-rbtn.ko and dell-smo8800.ko)
>>> * WMI (used in dell-wmi.ko, dell-wmi-aio.ko, dell-led.ko)
>>> * SMBIOS (used in dell-laptop.ko, dell-wmi.ko and dell-led.ko)
>>> * some other platform code (used in dell-laptop.ko)
>>>
>>> And now notifier is needed for drivers:
>>> * dell-laptop.ko
>>> * dell-wmi.ko
>>> * dell-rbtn.ko
>>>
>>> And if I look at above two sets, none of above drivers is good candidate
>>> for central notifier functions... Maybe we should really introduce new
>>> separate file where will central dell notifier live?
>>
>> We could put this in a dell-common or some such. My main reason for
>> going with dell-smbios is that dell-smbios is a "library" module,
>> loading it does not do anything other then make symbols available
>> for use by other modules. So using it to store the notifier is safe
>> (no side effects even if e.g. only dell-rbtn gets loaded).
>
> I understand your motivation.
>
>> Given that we already have dell-smbios as dell library functions
>> module, I think that adding a dell-common is a bit overkill.
>
> New module is probably really overkill... But cannot we link add those
> notifier functions statically? So it would not be new module.

No, we need to put the notifier_head somewhere, at which point
making the actual notifier functions inline static is not really
helpful.

>> I can rename the notifier, maybe use dell_laptop*notifier as names,
>> since dell-laptop is the main consumer of the notifications ?
>
> Yes, this is name is better!

Ok, I will change this for the next version.

Regards,

Hans
