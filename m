From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v3] leds: Introduce userspace leds driver
Date: Thu, 15 Sep 2016 15:08:31 +0200
Message-ID: <20160915130831.GJ13132@amd>
References: <1473439776-15655-1-git-send-email-david@lechnology.com>
 <CGME20160912081846eucas1p255044e49034685ad44400d6830ef0b95@eucas1p2.samsung.com>
 <80597ded-f4b4-2990-3eae-e72276296d1a@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:59906 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751000AbcIONIe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Sep 2016 09:08:34 -0400
Content-Disposition: inline
In-Reply-To: <80597ded-f4b4-2990-3eae-e72276296d1a@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: David Lechner <david@lechnology.com>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>

Hi!

> >+	if (copy_from_user(&udev->user_dev, buffer,
> >+			   sizeof(struct uleds_user_dev))) {
> >+		ret = -EFAULT;
> >+		goto out;
> >+	}
> >+
> >+	if (!udev->user_dev.name[0]) {
> >+		ret = -EINVAL;
> >+		goto out;
> >+	}
> >+
> >+	ret = led_classdev_register(NULL, &udev->led_cdev);
> >+	if (ret < 0)
> >+		goto out;

No sanity checking on the name -> probably a security hole. Do not
push this upstream before this is fixed.

Thanks,
								Pavel
								
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
