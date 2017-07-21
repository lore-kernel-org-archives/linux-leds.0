From: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH 3/8] dt: bindings: Add a binding for referencing EEPROM
 from camera sensors
Date: Fri, 21 Jul 2017 14:14:14 +0300
Message-ID: <20170721111414.zzcww27bn3oqpshv@paasikivi.fi.intel.com>
References: <1497433639-13101-1-git-send-email-sakari.ailus@linux.intel.com>
 <1497433639-13101-4-git-send-email-sakari.ailus@linux.intel.com>
 <20170719075255.yuar2xbeyisgl3we@flea>
 <20170719092106.xqichkcd6yepchxy@kekkonen.localdomain>
 <20170719111843.kyoqtqonhdkyvrjz@flea>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170719111843.kyoqtqonhdkyvrjz@flea>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-leds-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pavel-+ZI9xUNit7I@public.gmane.org, divagar.mohandass-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, rajmohan.mani-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
List-Id: linux-leds@vger.kernel.org

Hi Maxime,

On Wed, Jul 19, 2017 at 01:18:43PM +0200, Maxime Ripard wrote:
> Hi Sakari,
> 
> On Wed, Jul 19, 2017 at 12:21:06PM +0300, Sakari Ailus wrote:
> > On Wed, Jul 19, 2017 at 09:52:55AM +0200, Maxime Ripard wrote:
> > > Hi Sakari,
> > > 
> > > On Wed, Jun 14, 2017 at 12:47:14PM +0300, Sakari Ailus wrote:
> > > > Many camera sensor devices contain EEPROM chips that describe the
> > > > properties of a given unit --- the data is specific to a given unit can
> > > > thus is not stored e.g. in user space or the driver.
> > > > 
> > > > Some sensors embed the EEPROM chip and it can be accessed through the
> > > > sensor's I2C interface. This property is to be used for devices where the
> > > > EEPROM chip is accessed through a different I2C address than the sensor.
> > > > 
> > > > The intent is to later provide this information to the user space.
> > > > 
> > > > Signed-off-by: Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> > > > Acked-by: Pavel Machek <pavel-+ZI9xUNit7I@public.gmane.org>
> > > > Reviewed-by: Sebastian Reichel <sebastian.reichel-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/media/video-interfaces.txt | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > > index a18d9b2..ae259924 100644
> > > > --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > > +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> > > > @@ -76,6 +76,9 @@ Optional properties
> > > >  
> > > >  - lens-focus: A phandle to the node of the focus lens controller.
> > > >  
> > > > +- eeprom: A phandle to the node of the EEPROM describing the camera sensor
> > > > +  (i.e. device specific calibration data), in case it differs from the
> > > > +  sensor node.
> > > 
> > > Wouldn't it makes sense (especially if you want to provide user space
> > > access) to reuse what nvmem provides for this?
> > 
> > I wasn't aware of the nvmem bindings. Thanks for the pointer.
> > 
> > These are EEPROM chips that already have bindings documented under
> > Documentation/devicetree/bindings/eeprom as well as existing drivers under
> > drivers/misc/eeprom. Is there a reason why we have separate eeprom and
> > nvmem devices? Do you see issues in adding nvmem support for the existing
> > eeprom drivers, other than it misses using the nvmem framework?
> 
> As far as I know, the nvmem framework has superseeded the
> drivers/misc/eeprom one, and both AT24 and AT25's bindings are still
> respected by their respective drivers in nvmem.

Right. This all makes sense now. Nvmem superseding the eeprom API isn't
very well documented I'd say. Especially if you did only looked into eeprom
drivers.

> 
> > There's also a small issue (or a big one, depending on which part of it you
> > consider) of the EEPROM content being parsed in the user space. The sensor
> > drivers do not use that information nor the contents are specific to the
> > sensor alone, it is ultimately up to the system integrator what to put to
> > the EEPROM. The typical size of an EEPROM is in perhaps one or two
> > kilobytes so that there's a lot of room for storing different individual
> > settings there.
> > 
> > nvmem bindings require referring to individual data cells but it's rather
> > the entire EEPROM contents that would be of interest here. I guess you
> > could create a single node under the EEPROM chip that covers the entire
> > chip. Or change the documentation to allow referring to the chip, rather
> > than a node under it.
> 
> I'm not sure I really followed your thoughts here, but the fact that
> the EEPROM are usually way larger than the data each and every driver
> needs is indeed true. And this is exactly why we have cells, in order
> to differentiate the camera calibration data, from the touchscreen
> ones, and from the MAC address of the device.
> 
> I guess if you really need the whole EEPROM, yeah, a single big cell
> would be the way to go I guess.

Ack.

The nvmem framework requires ACPI support then. We'll see how to get there.

> 
> And there's currently a way to lockdown the EEPROM at the provider
> level, I guess it would make sense to have the same kind of API for
> the consumer too if the data are to be protected.
> 
> I'm not that involved in nvmem anymore, so the maintainer might have a
> different opinion though :)

-- 
Regards,

Sakari Ailus
sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
