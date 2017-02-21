From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v8 7/7] platform/x86/dell-*: Call
 led_classdev_notify_brightness_hw_changed on kbd brightness change
Date: Tue, 21 Feb 2017 17:14:06 +0100
Message-ID: <af30d146-8eb3-fbf7-7041-e719d8f9a5ac@redhat.com>
References: <20170209154417.19040-1-hdegoede@redhat.com>
 <20170209154417.19040-8-hdegoede@redhat.com> <20170221141108.GG9795@pali>
 <d1639790-24a3-8c81-651b-c8c8940ceeb5@redhat.com>
 <20170221145043.GK9795@pali>
 <0aed5655-11db-e632-0213-95779b780cb2@redhat.com>
 <20170221151317.GN9795@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
In-Reply-To: <20170221151317.GN9795@pali>
Sender: platform-driver-x86-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Hi,

On 21-02-17 16:13, Pali Rohár wrote:
> On Tuesday 21 February 2017 15:56:43 Hans de Goede wrote:
>>> So do we really need this code which prevents update?
>>
>> Yes, because the ABI specification for the new brightness_hw_changed says
>> that poll() listeners will only be woken up if the brightness is changed
>> outside of the kernel and not when the kernel changes it itself.
>
> So in case there are two applications in userspace which want to monitor
> brightness change and both of those application could change brightness
> (via sysfs) then these two applications would not know about every
> brightness change and would be out-of-sync of reality what is really
> configured by kernel.

Yes, because with triggers and blinking etc. it is impossible for
userspace to continuously monitor brigthness in a way which does not
cause a high system load.

> This is one part which I did not liked in proposed ABI as it force
> userspace to choose and use only one brightness monitoring application
> at same time.

Oh please, we are not going to have this whole ABI discussion again.
I already spend months on this, this ship has long sailed.

> Plus if ABI was specified that poll() could be used only for hardware
> change (and not by software e.g. kernel/userspace) then such
> functionality is not possible to implement for Dell machines. As it
> looks like Dell firmware send event about every change of brightness and
> we cannot distinguish if change was done by software (kernel) or by
> hardware itself.

It is possible just fine on Dell machines, except that libsmbios changes
will get seen as hardware triggered changes, which in a way they are
as libsmbios is making hardware changes behind the kernels back.

> I do not know now if you already accepted that ABI

Yes the ABI is in current next, and given that the 4.11 merge-window has
opened this ship has really sailed, also you're making a problem where
there really is none. Now can we please move forward with this ?

Regards,

Hans
