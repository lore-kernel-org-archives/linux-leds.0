From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [PATCH v7 1/1] leds: LED driver for TI LP3952 6-Channel Color LED
Date: Wed, 06 Jul 2016 23:15:53 +0200
Message-ID: <2752967.IJ5pkPUWjW@vostro.rjw.lan>
References: <1467129919-27641-1-git-send-email-tony.makkiel@daqri.com> <577BA931.5070403@samsung.com> <577D0869.7090806@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from cloudserver094114.home.net.pl ([79.96.170.134]:61226 "HELO
	cloudserver094114.home.net.pl" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with SMTP id S1752522AbcGFVLR (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 6 Jul 2016 17:11:17 -0400
In-Reply-To: <577D0869.7090806@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Tony <tony.makkiel@daqri.com>, linux-leds@vger.kernel.org, rpurdie@rpsys.net, Len Brown <lenb@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, ACPI Devel Maling List <linux-acpi@vger.kernel.org>, Al Stone <ahs3@redhat.com>

On Wednesday, July 06, 2016 03:32:25 PM Jacek Anaszewski wrote:
> On 07/05/2016 02:33 PM, Jacek Anaszewski wrote:
> > On 07/05/2016 02:12 PM, Rafael J. Wysocki wrote:
> >> On Tue, Jul 5, 2016 at 12:47 PM, Jacek Anaszewski
> >> <j.anaszewski@samsung.com> wrote:
> >>> PING
> >>>
> >>>
> >>> On 06/29/2016 12:54 PM, Jacek Anaszewski wrote:
> >>>>
> >>>> On 06/29/2016 12:07 PM, Tony wrote:
> >>>>>
> >>>>>
> >>>>> On 29/06/16 07:52, Jacek Anaszewski wrote:
> >>>>>>
> >>>>>> Hi Rafael,
> >>>>>
> >>>>>
> >>>>>>>> +#ifdef CONFIG_ACPI
> >>>>>>>> +static const struct acpi_device_id lp3952_acpi_match[] = {
> >>>>>>>> +    {LP3952_ACPI_NAME, 0},
> >>>>>>>
> >>>>>>>
> >>>>>>> No, you can't use "PRP0001" in this list.
> >>>>>>>
> >>>>>>>> +    {}
> >>>>>>>> +};
> >>>>>>>> +
> >>>>>>>> +MODULE_DEVICE_TABLE(acpi, lp3952_acpi_match);
> >>>>>>>
> >>>>>>>
> >>>>>>> And you don't need this for the "PRP0001" thing to work.  The
> >>>>>>> core will
> >>>>>>> take care of it for you then.
> >>>>>>>
> >>>>>>>> +#endif
> >>>>>>>
> >>>>>>>
> >>>>>>> So the entire ACPI block can be dropped for now.
> >>>>>>>
> >>>>>>> And the driver doesn't have to depend on CONFIG_ACPI any more,
> >>>>>>> does it?
> >>>>>>
> >>>>>>
> >>>>>> The driver currently supports probing only with ACPI.
> >>>>>> I have one question BTW: isn't there anything similar to the
> >>>>>> device tree
> >>>>>> bindings documentation required for ACPI overlays?
> >>>>>> Pointer to the discussion which led us to this solution:
> >>>>>>
> >>>>>> http://www.spinics.net/lists/linux-leds/msg06230.html
> >>>>>>
> >>>>> _DSD is working now. I managed to get "PRP0001" working as
> >>>>> suggested by
> >>>>> Rafael in
> >>>>> http://marc.info/?l=linux-acpi&m=146711623115228&w=2
> >>>>> with _DSD
> >>>>
> >>>>
> >>>> Thanks for the link.
> >>>>
> >>>> Rafael, "Package" entries seem to mimic Device Tree properties defined
> >>>> in the common leds bindings. Would it be possible to make it even
> >>>> more compatible and define every LED connected to the LED controller
> >>>> in the form of a child node, similarly as in case of LED DT bindings?
> >>>>
> >>>> See Documentation/devicetree/bindings/leds/common.txt and other
> >>>> bindings in Documentation/devicetree/bindings/leds.
> >>
> >> I'm not sure what you mean.
> >>
> >> If somebody decides to arrange the data in their ACPI tables to follow
> >> that scheme, it will just work IMO.
> >>
> >> Is there anything more that needs to be done in the kernel here?
> >
> > In case of Device Tree based platforms it is customary to define each
> > LED as a child node of the LED controller node. LED names can then
> > be obtained from the 'label' property or DT node name.
> > Tony has encountered some issues [1] while trying to follow this
> > pattern. Tony, could you please double check that?
> >
> > [1] http://www.spinics.net/lists/linux-leds/msg06230.html
> 
> One more question: now anyone wanting to use the driver would have
> to investigate the code to infer what DSD properties need to be
> provided for it. Isn't there anything similar to
> Documentation/devicetree/bindings/* documentation required in case of
> DSD?

There is a plan to set up a database for these, but that's still
under discussion (Al Stone has posted some related documentation for
comments recently).

> I've also come across your presentation [1], which describes the
> device_property* API for parsing unified DT/ACPI device properties.
> IMO it would be good solution for this driver as the device seems not
> to be tightly coupled with only ACPI platforms.
> 
> 
> [1] 
> http://events.linuxfoundation.org/sites/events/files/slides/ACPI_vs_DT.pdf

The device_property* API should be used everywhere where (a) properties are
used and (b) the code has no specific need to use a particular platform
firmware interface (ACPI or DT), so I agree.

Thanks,
Rafael
