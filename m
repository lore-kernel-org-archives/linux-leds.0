From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v8 7/7] platform/x86/dell-*: Call
 led_classdev_notify_brightness_hw_changed on kbd brightness change
Date: Wed, 22 Feb 2017 09:36:08 +0100
Message-ID: <7bb7c48f-789e-8b4c-b76b-1389d7fbbfb7@redhat.com>
References: <20170209154417.19040-1-hdegoede@redhat.com>
 <20170209154417.19040-8-hdegoede@redhat.com> <20170221141108.GG9795@pali>
 <d1639790-24a3-8c81-651b-c8c8940ceeb5@redhat.com>
 <20170221145043.GK9795@pali>
 <0aed5655-11db-e632-0213-95779b780cb2@redhat.com>
 <20170221151317.GN9795@pali>
 <af30d146-8eb3-fbf7-7041-e719d8f9a5ac@redhat.com>
 <20170221170838.GO9795@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:43372 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754457AbdBVIgM (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 22 Feb 2017 03:36:12 -0500
In-Reply-To: <20170221170838.GO9795@pali>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org

Hi,

On 21-02-17 18:08, Pali Rohár wrote:
> On Tuesday 21 February 2017 17:14:06 Hans de Goede wrote:
>> Hi,
>>
>> On 21-02-17 16:13, Pali Rohár wrote:
>>> On Tuesday 21 February 2017 15:56:43 Hans de Goede wrote:
>>>>> So do we really need this code which prevents update?
>>>>
>>>> Yes, because the ABI specification for the new brightness_hw_changed says
>>>> that poll() listeners will only be woken up if the brightness is changed
>>>> outside of the kernel and not when the kernel changes it itself.
>>>
>>> So in case there are two applications in userspace which want to monitor
>>> brightness change and both of those application could change brightness
>>> (via sysfs) then these two applications would not know about every
>>> brightness change and would be out-of-sync of reality what is really
>>> configured by kernel.
>>
>> Yes, because with triggers and blinking etc. it is impossible for
>> userspace to continuously monitor brigthness in a way which does not
>> cause a high system load.
>
> Triggers and blinking features are out due to high cpu load. Fine.
>
> But why also manual writes to /sys/class/leds/... by userspace
> applications is filtered and not reported via poll()?

I agree that having a way for interested userspace to detect those
would be good, but that would need to be another API, may poll()
on the brightness attribute itself while excluding triggers / blinking
changes from wakeup ?

Anyways that is something to discuss in a thread specific to the
LED subsystem and somewhat orthogonal to this patch.

One disadvantage of poll() is that it does not give the source of
the change, so in retrospect I actually like the new brightness_hw_changed
attribute as that does give the source, which is something which we need
to know in userspace. In previous versions of the ABI I had to do
the same brightness comparison I'm doing in the dell-laptop driver
now in userspace, where it can never be done safely as userspace does
not know about other userspace.

Since the Dell smbios events don't provide us with a source of the
change, we need to compare the brightness to the last set brightness
somewhere and IMHO the kernel is the best (least bad) place to do
that.

> Due to fundamental reasons we ignore all race condition between
> libsmbios and kernel (they are basically not possible to solve). I'm
> fine with this.
>
> But why should setting keyboard backlight via smbios-keyboard-ctl and
> via echo > /sys/class/leds/ behave differently?

Because we cannot solve the smbios-keyboard-ctl case, but we can solve
the echo case, as said we could probably use a new kernel ABI to allow
userspace to detect changes caused by the echo example, but that
really is a whole new discussion.

Regards,

Hans
