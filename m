From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: LED subsystem child DT node ref counting
Date: Fri, 17 Apr 2015 13:03:45 +0200
Message-ID: <5530E891.20707@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:56710 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751795AbbDQLDu (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 17 Apr 2015 07:03:50 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: Linux LED Subsystem <linux-leds@vger.kernel.org>, Sakari Ailus <sakari.ailus@iki.fi>, Bryan Wu <cooloney@gmail.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>

Hi,

I'd like to clarify whether LED subsystem drivers behave correctly
or not, regarding child DT nodes reference counting.

Single LED controller can have connected more then one LED to it.
The LEDs are represented by child DT nodes of the node representing
the controller (see Documentation/devicetree/bindings/leds).

LED subsystem drivers parse child DT nodes and use the node name,
or 'label' property string as the LED class device name.

This is usually accomplished like below:

for_each_child_of_node(np, child) {
     ...
     led.name = of_get_property(child, "label", NULL) ? : child->name;


The question is whether reference count of the child node shouldn't
be increased here with of_node_get(child). Whereas intuitively it could
be thought of as a right thing to do, empirical experiments don't
necessary confirm that.

When I print the value of child_node->kobj.kref.refcount.counter
inside for_each loop it is 3 and and after leaving the loop it gets
decreased to 2. On driver removal the value is also 2. It means that
label is available all the time, without increasing child node ref
counter.

I'd like to ask if this is guaranteed to be always true.

-- 
Best Regards,
Jacek Anaszewski
