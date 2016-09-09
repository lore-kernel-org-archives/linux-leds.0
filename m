From: David Lechner <david@lechnology.com>
Subject: Re: [PATCH v3] leds: Introduce userspace leds driver
Date: Fri, 9 Sep 2016 15:44:34 -0500
Message-ID: <90740877-e729-38c0-cc8b-0f80050125e7@lechnology.com>
References: <1473439776-15655-1-git-send-email-david@lechnology.com>
 <alpine.LRH.2.20.1609091525060.22407@federalhill.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1609091525060.22407@federalhill.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Kelly French <kfrench@federalhill.net>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Jacek Anaszewski <j.anaszewski@samsung.com>
List-Id: linux-leds@vger.kernel.org

On 09/09/2016 02:30 PM, Kelly French wrote:
>
> Replying privately, as I'm not involved in the kernel community.
>

By offering your opinion, you are now involved in the community. No need 
to be shy. :-)

> I'm looking forward to this functionality.  I'm a little worried about
> the interface.  Is it possible to create the new uled devices in some
> other way?
>
> Maybe one insmod per uled device?  Maybe a new /proc/ entry (yuck) where
> you can echo the name into it, which will trigger udev to create the
> appropraite /dev/uled-name device?
>
> I'm hoping that the final interface is something I can just "cat
> /dev/uled-name" instead of having to write a binary struct into it at
> the beginning.  I'm even ok with just echoing text into the dev entry
> before reading.  It's the binary struct that's bugging me.
>


I originally considered using configfs to setup new LEDs[1], which would 
be very much like what you are suggesting, but I find the way my current 
patch works to be much simpler.

With this patch, you can create multiple LEDs. You just have to open a 
file handle to /dev/uleds for each LED that you want to create. Also, 
the LED device is automatically destroyed when the file handle is 
closed. I think this is nice because if the program that created it 
crashes, then it is automatically cleaned up.

I agree it would be much more convenient to not use a binary struct, but 
I think the complexity of implementing it outweighs any benefit to be 
gained. And it is easy enough to use an interactive python shell to 
handle the things that bash can't if the interactive part is what you 
really want.



[1]: https://lkml.org/lkml/2016/7/25/505
