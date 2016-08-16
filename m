From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2] leds: trigger: Introduce an USB port trigger
Date: Tue, 16 Aug 2016 23:22:12 +0200
Message-ID: <CACna6rwcBx1gfmAJWEA=0=nEo-357ZGn99JPxtea3KkSJiF_RA@mail.gmail.com>
References: <1468239883-22695-1-git-send-email-zajec5@gmail.com>
 <1468617060-29830-1-git-send-email-zajec5@gmail.com> <20160720010222.GA21679@rob-hp-laptop>
 <CACna6rwzwRibjYpV3gGfVjHF8m0+cfLts6CE0p3HfURKJvnnQw@mail.gmail.com>
 <20160721204259.GA4931@rob-hp-laptop> <CACna6ryR=bi85b6ezBMHQ1xHShXGuo4+BFne=mBjzEgHZbtXtw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACna6ryR=bi85b6ezBMHQ1xHShXGuo4+BFne=mBjzEgHZbtXtw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Felipe Balbi <balbi@kernel.org>, Peter Chen <hzpeterchen@gmail.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Boris Brezillon <boris.brezillon@free-electrons.com>, Pavel Machek <pavel@ucw.cz>, Geert Uytterhoeven <geert@linux-m68k.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
List-Id: linux-leds@vger.kernel.org

On 29 July 2016 at 09:09, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
> HI Rob,
>
> I got problems following your objections, so it took me some time to
> go back to this.
>
> On 21 July 2016 at 22:42, Rob Herring <robh@kernel.org> wrote:
>> On Wed, Jul 20, 2016 at 10:06:23AM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
>>> On 20 July 2016 at 03:02, Rob Herring <robh@kernel.org> wrote:
>>> > On Fri, Jul 15, 2016 at 11:10:45PM +0200, Rafa=C5=82 Mi=C5=82ecki wro=
te:
>>> >> This commit adds a new trigger that can turn on LED when USB device =
gets
>>> >> connected to the USB port. This can be useful for various home route=
rs
>>> >> that have USB port and a proper LED telling user a device is connect=
ed.
>>> >>
>>> >> Right now this trigger is usable with a proper DT only, there isn't =
a
>>> >> way to specify USB ports from user space. This may change in a futur=
e.
>>> >>
>>> >> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>>> >> ---
>>> >> V2: The first version got support for specifying list of USB ports f=
rom
>>> >>     user space only. There was a (big try &) discussion on adding DT
>>> >>     support. It led to a pretty simple solution of comparing of_node=
 of
>>> >>     usb_device to of_node specified in usb-ports property.
>>> >>     Since it appeared DT support may be simpler and non-DT a bit mor=
e
>>> >>     complex, this version drops previous support for "ports" and
>>> >>     "new_port" and focuses on DT only. The plan is to see if this
>>> >>     solution with DT is OK, get it accepted and then work on non-DT.
>>> >>
>>> >> Felipe: if there won't be any objections I'd like to ask for your Ac=
k.
>>> >> ---
>>> >>  Documentation/devicetree/bindings/leds/common.txt |  11 ++
>>> >>  Documentation/leds/ledtrig-usbport.txt            |  19 ++
>>> >>  drivers/leds/trigger/Kconfig                      |   8 +
>>> >>  drivers/leds/trigger/Makefile                     |   1 +
>>> >>  drivers/leds/trigger/ledtrig-usbport.c            | 206 +++++++++++=
+++++++++++
>>> >>  5 files changed, 245 insertions(+)
>>> >>  create mode 100644 Documentation/leds/ledtrig-usbport.txt
>>> >>  create mode 100644 drivers/leds/trigger/ledtrig-usbport.c
>>> >>
>>> >> diff --git a/Documentation/devicetree/bindings/leds/common.txt b/Doc=
umentation/devicetree/bindings/leds/common.txt
>>> >> index af10678..75536f7 100644
>>> >> --- a/Documentation/devicetree/bindings/leds/common.txt
>>> >> +++ b/Documentation/devicetree/bindings/leds/common.txt
>>> >> @@ -50,6 +50,12 @@ property can be omitted.
>>> >>  For controllers that have no configurable timeout the flash-max-tim=
eout-us
>>> >>  property can be omitted.
>>> >>
>>> >> +Trigger specific properties for child nodes:
>>> >> +
>>> >> +usbport trigger:
>>> >> +- usb-ports : List of USB ports that usbport should observed for tu=
rning on a
>>> >> +           given LED.
>>> >
>>> > I think this should be more generic such that it could work for disk =
or
>>> > network LEDs too. Perhaps 'led-triggers =3D <nodes>'? trigger is a bi=
t of
>>> > a Linux name, but I haven't thought of anything better. Really, I'd
>>> > prefer the link in the other direction (e.g. port node have a 'leds" =
or
>>> > '*-leds' property), but that's maybe harder to parse.
>>>
>>> I was already thinking on this as I plan to add "netdev" trigger at
>>> some point in the future. I'd like to use "net-devices" for it (as a
>>> equivalent or "usb-ports").
>>>
>>> However there is a problem with your idea of sharing "led-triggers"
>>> between triggers.. Consider device with generic purpose LED that
>>> should be controllable by a user. I believe we should let user switch
>>> it's state, e.g. with:
>>> echo usbport > trigger
>>> echo netdev > trigger
>>> with a shared property I don't see how we couldn't handle it properly.
>>
>> Well, the userspace interface and DT bindings are independent things.
>> You can't argue for what the DT binding should look like based on the
>> userspace interface.
>
> I don't understand that. It sounds like you don't want user to have
> control over a LED that was specified in DT. If I got it right, it
> sounds like a bad idea to me. It's a known case (in marketing, usage
> model) to allow user disable all LEDs (e.g. to don't disturb him
> during the night). That sounds like a valid usage for me, so I want
> user to be able to switch between triggers. And this is of course what
> is already supported by triggers and user space interface. With
> *current* triggers implementation you can do:
> cd /sys/class/leds/foo/
> echo none > trigger
> echo timer > trigger
>
> So I'm trying to have trigger specific entry in order to support more
> than a single trigger.
>
>
>> Perhaps we need a "device trigger" where you echo the device to
>> be the trigger (similar to how bind works). If you have something to id
>> the device, then you can lookup its struct device and then its of_node
>> ptr.
>
> Are you describing mixing user space interface with DT interface at
> this point? Because echoing device sounds like doing some "echo foo >
> bar" in user space. If so, I didn't design setting trigger details
> from user space yet. I'm aware it'll require more discussion, so I
> left it fo later.
>
>
>> The other problem with your userspace interface is it only works if
>> the trigger is defined in DT. It doesn't allow for specifying which usb
>> port or which netdev. Any trigger source should be assignable to any
>> LED? I can assign the disk activity trigger to the numlock LED if I
>> want to...
>
> Well, it's not a surprise, I pretty straightly described it in the
> commit message:
>> Right now this trigger is usable with a proper DT only, there isn't a
>> way to specify USB ports from user space. This may change in a future.
> I mean to discuss and add a way of specifying sources to the trigger
> in the future.
>
> To answer your question: you can't assign trigger source to the LED.
> First you need to assign trigger to the LED. Then some triggers may
> allow setting extra parameters.
>
> There are not limitations on assigning triggers. So you can e.g.
> assign disk activity trigger to the USB LED. LEDs subsystem doesn't
> store info about LED type, only its name.
>
>
>>> I don't think we can use anything like:
>>> led-triggers =3D <&ohci_port1>, <&ehci_port1>, <&ethmac0>;
>>> I'd get even more complicated if we ever need cells for any trigger.
>>> AFAIK it's not allowed to mix handles with different cells like:
>>> led-triggers =3D <&ohci_port1>, <&foo 5>, <&ethmac0>;
>>
>> It is allowed, but you would have to have a '#led-trigger-cells'
>> property in each phandle target.
>>
>>> These problems made me use trigger-specific properies for specifying
>>> LED triggers. Do you have any other idea for sharing a property &
>>> avoiding above problems at the same time?
>>>
>>>
>>> >> +
>>> >>  Examples:
>>> >>
>>> >>  system-status {
>>> >> @@ -58,6 +64,11 @@ system-status {
>>> >>       ...
>>> >>  };
>>> >>
>>> >> +usb {
>>> >> +     label =3D "USB";
>>> >
>>> > It's not really clear in the example this is an LED node as it is
>>> > incomplete.
>>>
>>> What do you mean by incomplete? Should I include e.g. ohci_port1 in
>>> this example?
>>
>> label and usb-ports alone in this node does not make an LED node.
>
> I just followed the current form of
> Documentation/devicetree/bindings/leds/common.txt . Should we improve
> this while in general? It already has a similar example like this:
> system-status {
>         label =3D "Status";
>         linux,default-trigger =3D "heartbeat";
>         ...
> };
>
>
>>> >> +     usb-ports =3D <&ohci_port1>, <&ehci_port1>;
>>> >> +};
>>> >> +
>>> >>  camera-flash {
>>> >>       label =3D "Flash";
>>> >>       led-sources =3D <0>, <1>;
>>> >> diff --git a/Documentation/leds/ledtrig-usbport.txt b/Documentation/=
leds/ledtrig-usbport.txt
>>> >> new file mode 100644
>>> >> index 0000000..642c4cd
>>> >> --- /dev/null
>>> >> +++ b/Documentation/leds/ledtrig-usbport.txt
>>> >> @@ -0,0 +1,19 @@
>>> >> +USB port LED trigger
>>> >> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> >> +
>>> >> +This LED trigger can be used for signaling user a presence of USB d=
evice in a
>>> >> +given port. It simply turns on LED when device appears and turns it=
 off when it
>>> >> +disappears.
>>> >> +
>>> >> +It requires specifying a list of USB ports that should be observed.=
 This can be
>>> >> +done in DT by setting a proper property with list of a phandles. If=
 more than
>>> >> +one port is specified, LED will be turned on as along as there is a=
t least one
>>> >> +device connected to any of ports.
>>> >> +
>>> >> +This trigger can be activated from user space on led class devices =
as shown
>>> >> +below:
>>> >> +
>>> >> +  echo usbport > trigger
>>> >
>>> > Why do I have to do this (by default)? I already specified in the DT
>>> > what the connection is. It should come up working OOTB, or don't put =
it
>>> > in DT.
>>>
>>> Just specifying connection with "usb-ports" (or "led-triggers") won't
>>> enable a given trigger and it shouldn't. There is already a way to
>>> specify default trigger using property "linux,default-trigger". So you
>>> can specify:
>>> 1) Default one with:
>>> linux,default-trigger =3D "usbport";
>>> 2) On runtime:
>>> echo usbport > trigger
>>
>> IMO, these should be mutually exclusive. Either you specify a DT node as
>> the trigger or you specify a linux specific trigger.
>
> I don't think I'm even able to make them exclusive without reworking
> triggers subsystem. It's what is already implemented there and trigger
> can't really say it refuses to be unassigned from the LED.
> Also if we don't allow changing current trigger (by echo foo >
> trigger) it won't be possible to disable LED (e.g. for a night) or
> change trigger for some multi purpose LEDs.
>
>
>>> >> +Nevertheless, current there isn't a way to specify list of USB port=
s from user
>>> >> +space.
>>> >
>>> > s/current/currently/
>>> >
>>> > This is a problem since if it works by default and you switch to a
>>> > different trigger, there's no way to get back to the default (unless
>>> > you remember the ports).
>>>
>>> There is no such problem. You can freely do:
>>> echo none > trigger
>>> (e.g. to disable LED during night or whatever)
>>> and then:
>>> echo usbport > trigger
>>>
>>> This will make "usbport" use triggers specified in DT as expected.
>>
>> I think the singular "usbport" trigger is problematic. Look at how cpu
>> triggers are done. I can specify which cpu is the trigger. You should be
>> able specify which port is the trigger, too.
>
> Maybe it would be possible to register separate trigger for every USB
> port. I can see some problems like fetching list of possible USB port
> (we don't have anything lovely like for_each_possible_cpu). Should
> list of ports be read from DT? Or maybe we should create/delete
> triggers dynamically as new USB hubs appear? That would require more
> logic like detecting how many ports a hub supports.
>
> Anyway, the serious limitation I see is assigning more than a single
> port to a LED. One LED can have only 1 trigger assigned at the time.
> There are plenty of devices with 1 USB LED and few USB ports. Also
> some physical ports are handled by more than 1 controller (up to 3 or
> more). We really need a way to assign more than 1 USB port to a single
> LED.
> This seems to be also a limitation of CPU trigger I didn't notice so
> far. What if you have dual CPU device with only 1 CPU activity LED?
>
>
>> In summary, I guess what I'm saying is don't push the problems of the
>> current userspace interface down to DT.
>
> Thanks for your time and looking at this problem with me. I'm afraid
> I'll need some more help (or so it seems so far to me).
>
> I'm wondering if we have some misunderstanding on this whole thing
> with USB port trigger. Maybe I didn't explain my use case well enough
> and it's clear to me only?
>
> I'm coming from OpenWrt/LEDE project which is basically a distribution
> for home routers. We deal with a wide range of devices you can find on
> a market. We also have plenty of out of tree drivers and solutions I'm
> not a big fan of. I'm trying to improve/rewrite them, get them in an
> acceptable form and upstream.
>
> One of problems we got are USB LEDs. We have some out of tree driver for =
them:
> http://git.openwrt.org/?p=3D15.05/openwrt.git;a=3Dblob;f=3Dtarget/linux/g=
eneric/files/drivers/leds/ledtrig-usbdev.c;hb=3DHEAD
> but it doesn't work well. It doesn't have any DT support. It requires
> user to know USB ports. He has to write some script that will setup a
> trigger on every boot. It works for 1 USB port only.
>
> So I would like to:
> 1) Have a USB trigger selectable with "linux,default-trigger"
> 2) Have property next to "linux,default-trigger" specifying USB ports
> 3) Have trigger follow ports, light LED on if any of them has device conn=
ected
> 4) Allow user to deactivate this trigger (e.g. no LEDs on during night)
>
> Some extra notes:
> 1) I don't think it's possible for a single trigger to handle various
> devices like USB or network ones. Later we may may want to add more
> complex stuff like blinking on activity. It's too much to handle in a
> single trigger.
> 2) I'm trying to be thinking future-proof and I think we may need
> switching between triggers in the future. I mean allowing user to
> choose between some more complex triggers, not just "none" and "foo".
> Maybe some status LED (with default-on trigger) that can get network
> activity trigger assigned during WPS action? Such a possibility of
> changing triggers would go in pair with current implementation (echo
> "foo" > trigger).
>
> Does it make my attempts to make any more sense? Can you suggest some
> way I should proceed?

Ping?

--=20
Rafa=C5=82
