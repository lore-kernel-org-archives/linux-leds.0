From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Subject: Re: [PATCH 0/6] Introduce audio-mute LED trigger (and
 conversions to it)
Date: Thu, 29 Nov 2018 22:23:31 +0100
Message-ID: <5f8eece3-95af-7866-d7d0-02cc3cb695ca@gmail.com>
References: <20181126171126.20280-1-tiwai@suse.de>
 <20181127084418.GA20504@amd> <20181128111806.cb3cncpjeq73sptg@pali>
 <s5hy39dv3dg.wl-tiwai@suse.de> <20181128122505.GA1193@amd>
 <8bb45cc6-9f98-9fed-9676-7f1429328c4a@gmail.com> <20181128203410.GA20670@amd>
 <20181128204612.l3bayhop4qmep2hj@pali>
 <0ed37870-c7b6-fd6b-2f6e-7325fdde3629@gmail.com> <20181128212212.GE20670@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <20181128212212.GE20670@amd>
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
To: Pavel Machek <pavel@ucw.cz>
Cc: alsa-devel@alsa-project.org, Ayman Bagabas <ayman.bagabas@gmail.com>, Takashi Iwai <tiwai@suse.de>, platform-driver-x86@vger.kernel.org, Hui Wang <hui.wang@canonical.com>, ibm-acpi-devel@lists.sourceforge.net, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On 11/28/2018 10:22 PM, Pavel Machek wrote:
> Hi!
> 
>>> If external USB keyboard is identified as "input7" device, then
>>> "input7::mute" is a good name for mute key. But "sys::mute" does not say
>>> anything to which device or hardware it belongs nor does not solve
>>> problem that which device/driver/subsystem should have privilege to take
>>> this "sys" name.
>>
>> How about just "platform" for the LEDs being part of the device
>> on which the system is running?
> 
> "platform" works for me.
> 
> Are we in agreement that this name will be used for all similar LEDs,
> as long as they are on the "main box" of the device, no matter if they
> are connected using acpi, gpio, i2c, ...?

One doubt: say we have hdd activity LED on the "main box" - it
would be named "platform::disk".

Now, we add external USB disk. Previously we were considering
the naming for disk LEDs in the form e.g. "sdb::disk".

If so, there would be discrepancy between internal and external disk
LED names. Similarly in case of eth/adsl/wlan/camera LEDs.

Regarding sound devices - how would we name micmute LED for USB
microphone? I suppose that it is possible to discover some unique
identifier in runtime - this is a question to ALSA people.

-- 
Best regards,
Jacek Anaszewski
