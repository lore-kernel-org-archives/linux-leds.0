From: Bryan Wu <cooloney@gmail.com>
Subject: Re: how to represent sequence of brightnesses in /sys (was Re:
 [PATCH] Add the LED burst trigger)
Date: Thu, 2 Jan 2014 16:16:38 -0800
Message-ID: <CAK5ve-LOFE6h5w=+pSgfYMaW5GZQfayVfpRzP0NAfMPWZkk5iw@mail.gmail.com>
References: <20131227095705.GC17143@amd.pavel.ucw.cz> <BLU172-W8D850A8DEA8C0D87FBF45ACCC0@phx.gbl>
 <20131228101622.GA13564@amd.pavel.ucw.cz> <CAMuHMdVz7FWgYZRVHy6pK+g_2QKxTW00N8jmjWHe05m5CJvPOw@mail.gmail.com>
 <20131228192935.GA28119@amd.pavel.ucw.cz> <CAMuHMdXDJ6uhe6srV-+0a8=cpBUgP+VakG+_wyLwAuiQSRVhqQ@mail.gmail.com>
 <20131228212523.GA8733@amd.pavel.ucw.cz> <20131228215042.GA7048@kroah.com>
 <20131228235045.GA8786@amd.pavel.ucw.cz> <20131229014324.GB18455@kroah.com> <20131229112101.GB26295@amd.pavel.ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20131229112101.GB26295@amd.pavel.ucw.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: Pavel Machek <pavel@ucw.cz>
Cc: Greg KH <greg@kroah.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Joe Xue <lgxue@hotmail.com>, "rpurdie@rpsys.net" <rpurdie@rpsys.net>, "rob@landley.net" <rob@landley.net>, "milo.kim@ti.com" <milo.kim@ti.com>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Sun, Dec 29, 2013 at 3:21 AM, Pavel Machek <pavel@ucw.cz> wrote:
> Hi!
>
>> > Idea would be "sequence of brigtnesses" (one file) and "delay between
>> > changes" (second file).
>>
>> Ick.
>>
>> > Reason to do it in kernel is that some machines actually have
>> > "coprocessor" on i2c that can do it while main CPU is suspended. (For
>> > more reasons, see beggining of thread).
>>
>> Ick ick.
>>
>> > Binary attribute with array of bytes should be acceptable, rights?
>>
>> Not at all.
>>
>> > (IOW write(..., buf, size) )
>> >
>> > Ascii array of decimal integers -- no so, right?
>> >
>> > (IOW printf("%d %d ..", buf[0], buf[1]) )
>>
>> Use an ioctl with a structure to get things correct as a character
>> device.  As odds are, you aren't going to be able to create a "generic"
>> format for all of this for all types of devices that support such a
>> "co-processor".
>
> Well, we already do have hw-specific driver in the tree,
> drivers/leds/leds-lp55xx-common.c . But the interface is
> "interesting" and I believe we should have generic interface and it
> should use existing trigger framework -- array of brightnesses does
> not seem too complicated.
>
> Do you have suggestion how to pass the brightnesses over sysfs?
>

What about send those binary stuff as firmware through kernel firmware
interface and LED trigger sysfs is just for parameters setup and
enable/disable controlling.

Thanks,
-Bryan
