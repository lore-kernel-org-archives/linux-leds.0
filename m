From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 04/24] dt-bindings: leds: Add function and color properties
Date: Fri, 21 Dec 2018 11:12:53 +0100
Message-ID: <CACRpkdakp666YykdTqt=CGiqzkz-jBLbh=sSDuS7_M8Rw_8Y3w@mail.gmail.com>
References: <1541542052-10081-1-git-send-email-jacek.anaszewski@gmail.com>
 <1541542052-10081-5-git-send-email-jacek.anaszewski@gmail.com>
 <5bea0eb8.1c69fb81.6b921.80e6@mx.google.com> <dfb5bd23-bcb9-7501-a608-969cb0464168@gmail.com>
 <0a0b176c-4eb4-4b0e-6c3c-b3c6c8f5fff5@gmail.com> <CAL_JsqKEpbJjExkQKSXwYma9wPPO+8E0QMTyWTPs1nkGSd49_g@mail.gmail.com>
 <20181130210814.GA5756@amd> <CAL_JsqK4oaUTBemXiTZzLeOKOndQ_GZp2F7mJ0VzGEKVGHY20Q@mail.gmail.com>
 <fa5add90-e1b7-d527-374f-175abdf88455@gmail.com> <CAL_Jsq+EsTXghh-bEtBmQ3oXEW45RJZJEJ2Zn1z-LfhvhNiXnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAL_Jsq+EsTXghh-bEtBmQ3oXEW45RJZJEJ2Zn1z-LfhvhNiXnQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Linux LED Subsystem <linux-leds@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Baolin Wang <baolin.wang@linaro.org>, Daniel Mack <daniel@zonque.org>, Dan Murphy <dmurphy@ti.com>, Oleh Kravchenko <oleg@kaa.org.ua>, Sakari Ailus <sakari.ailus@linux.intel.com>, Simon Shields <simon@lineageos.org>
List-Id: linux-leds@vger.kernel.org

On Tue, Dec 11, 2018 at 6:27 PM Rob Herring <robh@kernel.org> wrote:
> On Sat, Dec 1, 2018 at 3:17 PM Jacek Anaszewski
> <jacek.anaszewski@gmail.com> wrote:

> > This is not true in case of associations where LED controller is
> > an independent device, as in Pavel's example [0].
>
> I'm not really following how the HDD example is different. The parent
> of an LED would be the controller. The link to the led node would be
> in the disk controller node. Though maybe if things get complicated
> enough, we'd want to describe the drives or drive bays in DT.

Not talking about this in specific, but I will need to add DT bindings
for ATA master/slave, in order to add a temperature zone
for each drive (one sensor in each drive) in my in-progress
hwmon-over-SCSI-emulation-ATA-sensors such that:

ata-controller {
      ata-master {
      };
      ata-slave {
      };
};

I haven't looked closer at this topology yet, but we definatelt
need nodes for each physical connector out of an ATA
master, somehow, so they can act as a sensor/temperature
zone.

Yours,
Linus Walleij
