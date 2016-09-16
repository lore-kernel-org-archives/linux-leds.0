From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3] leds: Introduce userspace leds driver
Date: Fri, 16 Sep 2016 08:09:49 +0200
Message-ID: <20160916060949.GE13205@amd>
References: <1473439776-15655-1-git-send-email-david@lechnology.com>
 <CGME20160912081846eucas1p255044e49034685ad44400d6830ef0b95@eucas1p2.samsung.com>
 <80597ded-f4b4-2990-3eae-e72276296d1a@samsung.com>
 <20160915130831.GJ13132@amd>
 <20160915133558.GA29883@amd>
 <5e86399e-65a0-9251-d08e-ab8bfe1f5fbb@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55807 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751241AbcIPGJw (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Sep 2016 02:09:52 -0400
Content-Disposition: inline
In-Reply-To: <5e86399e-65a0-9251-d08e-ab8bfe1f5fbb@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: David Lechner <david@lechnology.com>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>

On Thu 2016-09-15 16:54:35, Jacek Anaszewski wrote:
> Hi Pavel,
> 
> On 09/15/2016 03:35 PM, Pavel Machek wrote:
> >Hi!
> >
> >>>>+	if (copy_from_user(&udev->user_dev, buffer,
> >>>>+			   sizeof(struct uleds_user_dev))) {
> >>>>+		ret = -EFAULT;
> >>>>+		goto out;
> >>>>+	}
> >>>>+
> >>>>+	if (!udev->user_dev.name[0]) {
> >>>>+		ret = -EINVAL;
> >>>>+		goto out;
> >>>>+	}
> >>>>+
> >>>>+	ret = led_classdev_register(NULL, &udev->led_cdev);
> >>>>+	if (ret < 0)
> >>>>+		goto out;
> >>
> >>No sanity checking on the name -> probably a security hole. Do not
> >>push this upstream before this is fixed.
> >
> >And actually... is it possible to have more then one userspace LED
> >with this interface? I do have RGB LED connect on /dev/ttyUSB0, and I
> >guess userspace driver would be appropriate, but it needs 3
> >channels...
> 
> Each new successful write to /dev/uleds creates a new LED class device.
> 
> See Documentation/leds/uleds.txt.

Umm. No, only one write is permitted to /dev/uleds according to the
code. In the email thread, it says:

# With this patch, you can create multiple LEDs. You just have to open a
# file handle to /dev/uleds for each LED that you want to create. Also,
# the LED device is automatically destroyed when the file handle is
# closed. I think this is nice because if the program that created it
# crashes, then it is automatically cleaned up.

...which should be actually ok. Sorry for the noise.

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
