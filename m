From: Sasha Levin <Alexander.Levin@microsoft.com>
Subject: Re: [PATCH AUTOSEL for 4.14 065/110] led: core: Fix brightness
 setting when setting delay_off=0
Date: Sun, 4 Feb 2018 00:30:36 +0000
Message-ID: <20180204003029.2lkcmh6wvzpnlrls@sasha-lappy>
References: <20180203180015.29073-1-alexander.levin@microsoft.com>
 <20180203180015.29073-65-alexander.levin@microsoft.com>
 <20180203203525.GA5860@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180203203525.GA5860@amd>
Content-Language: en-US
Content-ID: <DB18DC4E6503B041AD4B573CBB9DE78A@namprd21.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Matthieu CASTET <matthieu.castet@parrot.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Jacek Anaszewski <jacek.anaszewski@gmail.com>
List-Id: linux-leds@vger.kernel.org

On Sat, Feb 03, 2018 at 09:35:26PM +0100, Pavel Machek wrote:
>On Sat 2018-02-03 18:00:59, Sasha Levin wrote:
>> From: Matthieu CASTET <matthieu.castet@parrot.com>
>>
>> [ Upstream commit 2b83ff96f51d0b039c4561b9f95c824d7bddb85c ]
>>
>> With the current code, the following sequence won't work :
>> echo timer > trigger
>>
>> echo 0 >  delay_off
>> * at this point we call
>> ** led_delay_off_store
>> ** led_blink_set
>> *** stop timer
>> ** led_blink_setup
>> ** led_set_software_blink
>> *** if !delay_on, led off
>> *** if !delay_off, set led_set_brightness_nosleep <--- LED_BLINK_SW is s=
et but timer is stop
>> *** otherwise start timer/set LED_BLINK_SW flag
>>
>> echo xxx > brightness
>> * led_set_brightness
>> ** if LED_BLINK_SW
>> *** if brightness=3D0, led off
>> *** else apply brightness if next timer <--- timer is stop, and will nev=
er apply new setting
>> ** otherwise set led_set_brightness_nosleep
>>
>> To fix that, when we delete the timer, we should clear LED_BLINK_SW.
>
>Can you run the tests on the affected stable kernels? I have feeling
>that the problem described might not be present there.

Hm, I don't seem to have HW to test that out. Maybe someone else does?

--=20

Thanks,
Sasha=
