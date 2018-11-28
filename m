From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 0/6] Introduce audio-mute LED trigger (and
 conversions to it)
Date: Wed, 28 Nov 2018 20:58:03 +0100
Message-ID: <8bb45cc6-9f98-9fed-9676-7f1429328c4a@gmail.com>
References: <20181126171126.20280-1-tiwai@suse.de>
 <20181127084418.GA20504@amd> <20181128111806.cb3cncpjeq73sptg@pali>
 <s5hy39dv3dg.wl-tiwai@suse.de> <20181128122505.GA1193@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20181128122505.GA1193@amd>
Content-Language: en-US
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Pavel Machek <pavel@ucw.cz>, Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Ayman Bagabas <ayman.bagabas@gmail.com>, platform-driver-x86@vger.kernel.org, Hui Wang <hui.wang@canonical.com>, ibm-acpi-devel@lists.sourceforge.net, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 11/28/2018 01:25 PM, Pavel Machek wrote:
> On Wed 2018-11-28 12:38:19, Takashi Iwai wrote:
>> On Wed, 28 Nov 2018 12:18:06 +0100,
>> Pali Roh=E1r wrote:
>>>
>>> On Tuesday 27 November 2018 09:44:18 Pavel Machek wrote:
>>>> Looks good... except one detail: you have "tpacpi::micmute" and
>>>> "dell::micmute". I know it follows "tradition", but we are trying to
>>>> fix that at the moment. Laptop micmute button is a laptop micmute
>>>> button, and userspace should not need to know what prefix to use
>>>> depending on vendor.
>>>>
>>>> I'd suggest using "sys::micmute".
>>>
>>> I can imagine that in future some devices like keyboards would have also
>>> mute led. We already have keyboards with mute key, so it is something
>>> not unrealistic. What should be name convention for these mute leds?
>>>
>>> Is not "sys::" prefix too generic?
>>
>> Good point.  I thought of "laptop::" but it's not always laptop.
>> "builtin::"?  Doesn't sound great, either.
>>
>> A nice godfather is required here...
> =

> Just use sys:: :-).
> =

> laptop:: would work for me, too. (It is always laptop in the cases we
> are handling now, right?)
> =

> When we get a keyboard with mute led, we'll have to decide if it
> should be input6::mute -- because it is on keyboard, or if it is
> sys::mute -- because the key is expected to mute whole system.

drivers/input/input-leds.c seems to already support mute LED.
It will be exposed as inputN::mute.

Documentation/leds/leds-class.txt defines LED naming pattern
to <devicename:color:function> and "sys" does not look as
something resembling device name.

-- =

Best regards,
Jacek Anaszewski
