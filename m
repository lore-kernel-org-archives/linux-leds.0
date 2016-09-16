From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3] leds: Introduce userspace leds driver
Date: Fri, 16 Sep 2016 07:51:23 +0200
Message-ID: <20160916055123.GB13205@amd>
References: <1473439776-15655-1-git-send-email-david@lechnology.com>
 <CGME20160912081846eucas1p255044e49034685ad44400d6830ef0b95@eucas1p2.samsung.com>
 <80597ded-f4b4-2990-3eae-e72276296d1a@samsung.com>
 <20160915130831.GJ13132@amd>
 <313cbae5-fd66-f0ae-79a9-a3f4273d6f9c@samsung.com>
 <d3f1810c-e97a-4460-1415-f54e8501cf64@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:55441 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753967AbcIPFv0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Sep 2016 01:51:26 -0400
Content-Disposition: inline
In-Reply-To: <d3f1810c-e97a-4460-1415-f54e8501cf64@lechnology.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>

On Thu 2016-09-15 10:31:50, David Lechner wrote:
> On 09/15/2016 09:54 AM, Jacek Anaszewski wrote:
> >Hi Pavel,
> >
> >On 09/15/2016 03:08 PM, Pavel Machek wrote:
> >>Hi!
> >>
> >>>>+    if (copy_from_user(&udev->user_dev, buffer,
> >>>>+               sizeof(struct uleds_user_dev))) {
> >>>>+        ret = -EFAULT;
> >>>>+        goto out;
> >>>>+    }
> >>>>+
> >>>>+    if (!udev->user_dev.name[0]) {
> >>>>+        ret = -EINVAL;
> >>>>+        goto out;
> >>>>+    }
> >>>>+
> >>>>+    ret = led_classdev_register(NULL, &udev->led_cdev);
> >>>>+    if (ret < 0)
> >>>>+        goto out;
> >>
> >>No sanity checking on the name -> probably a security hole. Do not
> >>push this upstream before this is fixed.
> >
> >Thanks for catching this.
> >
> >David, please check if the LED name sticks to the LED class
> >device naming convention.
> 
> I don't think it is a good idea to enforce the LED class naming convention.
> Someone may have a userspace application they want to test that has a
> hard-coded name that does not follow the convention.

Umm.

Noone has applications with hardcoded names that are not possible
today, right?

And better not encourage crazy names.

Best regards,
									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
