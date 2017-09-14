From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [patch v5 2/2] dt-bindings: mfd: Add Device Tree bindings for
 Mellanox programmable devices
Date: Thu, 14 Sep 2017 13:51:40 +0100
Message-ID: <20170914125140.2a7cwmgm7pzk6zuk@dell>
References: <1505371738-128683-1-git-send-email-vadimp@mellanox.com>
 <1505371738-128683-3-git-send-email-vadimp@mellanox.com>
 <20170914123824.us56wefi3di345mh@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170914123824.us56wefi3di345mh@dell>
Sender: platform-driver-x86-owner@vger.kernel.org
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: robh+dt@kernel.org, pavel@ucw.cz, devicetree@vger.kernel.org, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, jiri@resnulli.us, gregkh@linuxfoundation.org, andy.shevchenko@gmail.com, platform-driver-x86@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Thu, 14 Sep 2017, Lee Jones wrote:

> On Thu, 14 Sep 2017, Vadim Pasternak wrote:
> 
> > The mlxreg a multifunction device driver handling LEDs, events, exposing
> > through sysfs reset signal, and reset causes info. These components share
> > a common register space.
> > 
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > ---
> > v4->v5:
> >  Comments pointed out by Rob:
> >  - Avoid duplications in reg;
> >  - Remove unnecessary details in description;
> >  - Do not use names like phandels;
> >  Changes added by Vadim:
> >  - Combine hotplug nodes interrupt aggregation, register offset and mask
> >    properties into hotplug-spec properties;
> >  - Combine reset, cause, etc subnodes register offset, mask and effective
> >    bit properties into attr-spec properties;
> > v3->v4:
> >  Comments pointed out by Rob:
> >  - Make a separate patch /devicetree/bindings/vendor-prefixes.txt;
> >  - Add .txt to Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core
> >    and send it within this series;
> >  - Modify "compatible" property;
> >  - Modify explanation for "deferred" property;
> >  - Describe each subnode by its own section;
> >  - Don't use underscore in attribute names;
> > ---
> >  .../bindings/mfd/mellanox,mlxreg-core.txt          | 165 +++++++++++++++++++++
> >  1 file changed, 165 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core.txt
> 
> Wow!  I have never seen a binding like this before.
> 
> > diff --git a/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core.txt b/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core.txt
> > new file mode 100644
> > index 0000000..1e3cce5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/mellanox,mlxreg-core.txt
> > @@ -0,0 +1,165 @@
> > +Mellanox programmable device control.
> > +-------------------------------------
> > +This binding defines the device control interface over for Mellanox BMC based
> > +switches.
> > +
> > +Required properties:
> > +- compatible =  "mellanox,mlxreg-i2c" or
> > +		"mellanox,mlxreg-i2c-16"
> > +
> > +- #address-cells : must be 1;
> > +- #size-cells : must be 0;
> > +- reg : I2C address;
> > +
> > +Optional properties:
> > +- interrupt-parent : phandle of parent interrupt controller;
> > +- interrupts : interrupt line;
> > +- deferred : I2C deferred bus phandle;
> > +	     I2C bus activation order enforce for the cases when hot-plug
> > +	     devices are attached to I2C bus, which is initialized after the
> > +	     I2C bus, where programmable device is attached;
> 
> Dependencies aren't usually expressed in DT.
> 
> Why can't this be done pragmatically?
> 
> Usually we try to interrogate a device that we depend on and if it's
> not present, we return -EPROBE_DEFER and try again latter.

Actually, thinking about this.  Are these hierarchical?

If so, they would be better represented as a sub-node.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
