From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [BUG 4.9] New led trigger usbport gets the kernel to panic
Date: Thu, 8 Dec 2016 11:43:37 +0100
Message-ID: <20161208104337.GA26647@kroah.com>
References: <20161121094022.30478a37@gmail.com>
 <43ea90fb-780a-3612-77dd-265e877ac18e@milecki.pl>
 <20161201152825.3b2686db@gmail.com>
 <b7fb9a03-a7aa-97e9-0923-de11b71c1951@milecki.pl>
 <20161202094818.6b9c1ed2@gmail.com>
 <20161206172619.GB4406@amd>
 <CGME20161206173007epcas2p23440ee22a8b8c17d27f18774e20239d1@epcas2p2.samsung.com>
 <CACna6ryWat5=yocSxbzXw5Pk0S++hZ+bmENYndqb1CM3arNr1A@mail.gmail.com>
 <6c5ea183-4ef8-7524-034d-69fb388a3a7a@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6c5ea183-4ef8-7524-034d-69fb388a3a7a@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, Pavel Machek <pavel@ucw.cz>, Ralph Sennhauser <ralph.sennhauser@gmail.com>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On Thu, Dec 08, 2016 at 09:40:43AM +0100, Jacek Anaszewski wrote:
> Hi Rafał,
> 
> On 12/06/2016 06:29 PM, Rafał Miłecki wrote:
> > On 6 December 2016 at 18:26, Pavel Machek <pavel@ucw.cz> wrote:
> > > On Fri 2016-12-02 09:48:18, Ralph Sennhauser wrote:
> > > > On Thu, 1 Dec 2016 17:56:07 +0100
> > > > Rafał Miłecki <rafal@milecki.pl> wrote:
> > > > 
> > > > > On 12/01/2016 03:28 PM, Ralph Sennhauser wrote:
> > > > > > Below the oops with your debug patch applied.
> > > > > > 
> > > > > > (...)
> > > > > > 
> > > > > > root@wrt1900acs:/# cd sys/class/leds/pca963x\:shelby\:white\:usb2/
> > > > > > root@wrt1900acs:/sys/devices/platform/soc/soc:internal-regs/f1011000.i2c/i2c-0/0-0068/leds/pca963x:shelby:white:usb2#
> > > > > > echo usbport > trigger [  124.727665] leds
> > > > > > pca963x:shelby:white:usb2: [usbport_trig_add_port] port:dd708240
> > > > > > [  124.735266] leds pca963x:shelby:white:usb2:
> > > > > > [usbport_trig_add_port] port->port_name:usb1-port1
> > > > > > port->data:dd708140 [  124.745671] leds pca963x:shelby:white:usb2:
> > > > > > [usbport_trig_add_port] port:dd7083c0 [  124.753194] leds
> > > > > > pca963x:shelby:white:usb2: [usbport_trig_add_port]
> > > > > > port->port_name:usb2-port1 port->data:dd708140 [  124.763594] leds
> > > > > > pca963x:shelby:white:usb2: [usbport_trig_add_port] port:dd708300
> > > > > > [  124.771114] leds pca963x:shelby:white:usb2:
> > > > > > [usbport_trig_add_port] port->port_name:usb3-port1
> > > > > > port->data:dd708140
> > > > > > root@wrt1900acs:/sys/devices/platform/soc/soc:internal-regs/f1011000.i2c/i2c-0/0-0068/leds/pca963x:shelby:white:usb2#
> > > > > > echo 1 > ports/usb2-port1[  171.649751] leds
> > > > > > pca963x:shelby:white:usb2: [usbport_trig_port_store] buf:1
> > > > > > [  171.649751]  size:2
> > > > > > 
> > > > > > [  171.660160] leds pca963x:shelby:white:usb2:
> > > > > > [usbport_trig_port_store] port:dd7083c0 [  171.668103] leds
> > > > > > pca963x:shelby:white:usb2: [usbport_trig_port_store]
> > > > > > port->port_name:usb2-port1 port->data:dd708140 [  171.678678]
> > > > > > [usbport_trig_update_count] usbport_data->count:0 [  171.684457]
> > > > > > [usbport_trig_update_count] usbport_data->count:0 [  171.690253]
> > > > > > Unable to handle kernel NULL pointer dereference at virtual address
> > > > > > 00000000
> > > > > 
> > > > > Oh, so this happens a bit later than I expected or I could read from
> > > > > the backtrace. Anyway this debugging was still helpful, I think I can
> > > > > see a possible problem.
> > > > > 
> > > > > So most likely the crash happens at the:
> > > > > led_cdev->brightness_set(led_cdev, ...);
> > > > > call. I'm not sure what I was thinking when writing that code. It
> > > > > looks wrong.
> > > > > 
> > > > > The thing is some LEDs (drivers) don't provide brightness_set op.
> > > > > It's fine, we should just use brightness_set_blocking op when that
> > > > > happens. Of course kernel has proper helpers for that, we don't have
> > > > > to worry about the choice of op or scheduling the work. I have no
> > > > > idea why I didn't use a proper helper in the first place.
> > > > > 
> > > > > So we should simply replace above call with one of following ones:
> > > > > 1) led_set_brightness(led_cdev, ...);
> > > > > 2) led_set_brightness_nosleep(led_cdev, ...);
> > > > > 3) led_set_brightness_sync(led_cdev, ...);
> > > > > 
> > > > > I still have to check which one is correct. In theory we don't deal
> > > > > blinking at this point so we shouldn't need to use led_set_brightness.
> > > > > 
> > > > > led_set_brightness_nosleep looks like the most likely correct choice.
> > > > > 
> > > > > led_set_brightness_sync requires brightness_set_blocking which is not
> > > > > always present so most likely we don't want this one.
> > > > > 
> > > > > 
> > > > > If you have some free time and you want to play with this, please
> > > > > replace led_cdev->brightness_set
> > > > > with
> > > > > led_set_brightness_nosleep
> > > > > and give it a try. This should fix crashes for you.
> > > > > 
> > > > > I'll look at this again during next days.
> > > > 
> > > > Hi Rafał
> > > > 
> > > > I just gave 2) led_set_brightness_nosleep a try. The kernel no longer
> > > > crashes and the led does work as expected.
> > > 
> > > Do you have any patch that needs to be applied?
> > 
> > Yes, it has been pushed:
> > https://git.kernel.org/cgit/linux/kernel/git/gregkh/usb.git/commit/?h=usb-next&id=89778ba335e302a450932ce5b703c1ee6216e949
> > 
> > When sending it I didn't Cc linux-leds as get_maintainer.pl didn't
> > pick it. Should we add MAINTAINERS entry for ledtrig-usbport.c maybe?
> > 
> 
> I haven't tested this trigger earlier, probably due to the fact that
> it was targeted for usb subsystem, sorry about that. Nonetheless,
> I've just tried it on exynos4412-trats2 board and it seems not to
> work properly.
> 
> I have the board connected through USB (I have an opened ssh session),
> I'm doing "echo usbport > trigger", then I can see the "ports"
> directory, but it is empty.
> 
> Any ideas on the possible reasons? Exynos4412-trats2 uses
> Ethernet Gadget (with CDC Ethernet support) USB Gadget Driver
> for USB networking.

This trigger is for when your device is a USB host, not a gadget, so I
don't think it works on your hardware :)

thanks,

greg k-h
