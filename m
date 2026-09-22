Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9E94F5DF0
	for <linux-leds@vger.kernel.org>; Tue, 22 Sep 2026 06:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790060244; cv=pass; b=J9s2799S9l2jnYPbLLLoSLYN6TclAZtGb6d2K/GYIX1h0JzjjbMH6uuv1qPWtaFmNccx/9OrJFtFTEV7Vb3iwe5MvbQkFgM4eIAh5Vp57o5kpanEL8p08yJwk8tTC+xfA7iwNR+I14c8oSf9KP/yw1es4pgqNHok5KdYZYqb0JI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790060244; c=relaxed/simple;
	bh=gulGgmIcxQuucEmM7OxaEIEnWr9tYGmjARauLmlnFhI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P9lfzbHLGpazrlIp6IiySgQbG6Kf5+RU4EID2GmFBZp3URR5BBNPIfRrzA0DQGFmEwgPQJ2bfjTNYYTI0KvTnj4/QGgGarSbcK9zNNLOXsECh/QLRNdRCQonwlOBLSZAiY7QuOypJZ1KQ088y81ZH2J8sz7854rs/j/QX0FfUaE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bu75orBv; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bu75orBv"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e4aac929eso3313794d50.0
        for <linux-leds@vger.kernel.org>; Mon, 21 Sep 2026 23:57:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790060238; cv=none;
        d=google.com; s=arc-20260327;
        b=EqaWCoO3Wc3D2jYcqbq0SNklGxmh9X3V+nLUgWibDFgKyk8HTLtqy6qy5bNENmvBw+
         VNwMqUyUKy6jnXIM8kx9kWoq9WcWSmOWkSY/SNrRHvQur7ClonajxBtKGuREmgI0mVnK
         uWipAa1IJxAqsLs2VwvahJzWSnQdx64VR5KgLr5oRvYgcZuaJHLfA8LHAofdHVd25Pgh
         nN9dcPx3S8MdPOOvbEBeKfIROIueB9Po4yhMYqoA04xkxwqF9mUXYC1o8F2vQhF9WMzT
         iJxHtbehkvxC2RuK0/tv8yQ4uvlr0fRQ8fOgi2oOJh2wI2uew7b6+FjLz+0GLMnQqDAR
         C9xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=U4KectJeHaQp5P1/3b8Vu0MT+3IcZMHOfvXwrVXtfrY=;
        fh=XRMyVumdjSe3uHRzHKuf7xiRLab2KntozUH0BZ9YdnE=;
        b=CkLW2qeNkapivWDizkfM3klYC2pepuw41STJ5LinjZi4L0ICu3YPAjH3mBaw1LJx6b
         +0w7D37Ehm/H7YiPC32XnUEkWnuIOvihyfH472R9r3DGMjd6Wug5zyt7BtAx1zAJmFGP
         qkK1AJ30iF59p+mzLzPxV4CfUqdqAzlwuMaTD076gr4ZoGUQ5HZEiTKXRPldh8EWc0Y2
         Lbd1OhcqYqOlUqxrFRtLB4guVaWpOsdzsSwlUXu0fHv9ZWdMqJzEaLyT0CTJAgwzXE8i
         /ZMVcIiTK1wd0Fw0nCC8CvWGtTmI/I65puqkWW4lB5ZkV/Ezk5i3qTtTTeM1LNXoq7br
         X5qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790060238; x=1790665038; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U4KectJeHaQp5P1/3b8Vu0MT+3IcZMHOfvXwrVXtfrY=;
        b=Bu75orBvitgScQyBYo1pcGk5u/AVi62vH7nW+tEDgqRNof7PYMjtQl013t51uu/ZGE
         fodfN9QN2BhaKvShx0NhGBoYmcmerkrTXr+TzGYVELNs8EKwH6Fta/ZgdWUPfvJUZbMv
         LxpyMNasRkKw4ZnXkq74Nd4f3IepA6pAtNK8+hkzvvP3fcfG7yPn4ljBmg5BBhWxZqdE
         yhnl1aidJoMimUIzUuIQxyfCEdJlC40jGl8FSk2re7YkD2xgUqMtJtaCxeXalCJHOR6H
         ixEr5s8G9HXc+cXzat4SwVmUDO8PdwtIfsCrMxjd3a2IKCrDmFN6Yq4XBGjnuZNY3dBJ
         dzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790060238; x=1790665038;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U4KectJeHaQp5P1/3b8Vu0MT+3IcZMHOfvXwrVXtfrY=;
        b=GISnf/88JpRLWo69ZKK4iTW0ReNa6o85RklmDYfky4n6zYxE7F/YUtMpJucJwIsSyN
         nWNA8QQrSdvz0ECC/ZGzaoaJTjfWjPDWzmEu4sr7rscYs0oKibGTVIDnPx2/zaelVvbj
         34zlgQpMIurecAvKzP0EaRIeKF0A3hOeXNnXxO9yBR8IBS/fa6qT+WiI+TwysFFLhf2/
         NhFtyoBQbND+/W/bs6yQfEeOU11UtMaoTrsbL5tQXTL6u+zjWm4H/OB/DyYZkLn0+lUF
         hxDE8h1uWZIahzKji7vnqe1q6EYxypjrlEj3RkO/pHIxxi6TivqRq+DJJ+uH696lltpp
         jFzg==
X-Forwarded-Encrypted: i=1; AKwUvBwmtxhaJhMxUY0T1nRwDd5EbIJ6U5dGlz++GALKBY8e1j1xkMZwJ86/Jnx5pAOnZvbualttqklfdNSD@vger.kernel.org
X-Gm-Message-State: AFuF++kuDw1ubJOm4kRySa7YG3cKFSJW6a3+xhBXKJi/vyrCGfuxdZWY
	r5ozEnradR25efyF/OU/nA0ECESfMKOn7tTeftiBW2RsZwtUrdL/0fWBKXAwyz5Dli/+cyIRkoN
	m6TYg7u1h8DZ1MWQA2G3k1nKgcxiqwzH9D9DC/UGDrsdh
X-Gm-Gg: AYBFou2YJtp+ZtYILABZScn2JbmeQOWsvxyUqoQyEj07rMPtSZsKsGeyov+rm3VEWj8
	Xs6dXipZj2RhbvwyFftNsVKd5PFNkM8LfparzTTCLL/1elmeQ3xBwsWDhEGaosW6Jcm9neia4+D
	MPNmKz4h/ZJ7dMlXj9eZPcPDARonsO9WD1gyznLj5VxloiPSVy6/KPtNLHIilE0yhHKBvfY2Aou
	Pt3hFvIVbD4+v8mHTYbUnU3xQBG3tlK2feNH/cbKpzbcjZdMaSCQbFzXgRzjv1XE4DhCRy52ul2
	6dkCrWcY+BmEvQB5OcGlkeCD2zXq+ALl7CQYb3S71CuqGOCIXvzee/LJEA==
X-Received: by 2002:a05:690e:1505:b0:671:26c4:3ac6 with SMTP id
 956f58d0204a3-6717fcb4a0bmr4394504d50.37.1790060238169; Mon, 21 Sep 2026
 23:57:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921092128.346375-1-lgs201920130244@gmail.com> <20260921115423.GD1466037@killaraus.ideasonboard.com>
In-Reply-To: <20260921115423.GD1466037@killaraus.ideasonboard.com>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 22 Sep 2026 14:57:05 +0800
X-Gm-Features: AcwNN1WVoOYZCsSEVw6iHCW5xpwHzTDhebwFRSBQ8UxzNV5HWEqjVLiq3FnnnXA
Message-ID: <CANUHTR86sJ_W+0WHHWM1EA_5SASER5OBhZJR-=jmhQd9vuUyqA@mail.gmail.com>
Subject: Re: [PATCH v2] leds: flash: sgm3140: fix child node reference leak
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Jonathan Cameron <jic23@kernel.org>, 
	Luca Weiss <luca@lucaweiss.eu>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

On Mon, 21 Sept 2026 at 19:54, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Why did you submit a v2 ignoring my latest comments on v1 ?
>
> On Mon, Sep 21, 2026 at 05:21:28PM +0800, Guangshuo Li wrote:
> > sgm3140_probe() obtains a reference to the LED child node with
> > device_get_next_child_node(), but the reference is not released after a
> > successful probe.
> >
> > The child node is also passed to devm_led_classdev_flash_register_ext().
> > The LED class device stores the fwnode without taking a reference of its
> > own, so the reference obtained by sgm3140_probe() must remain valid until
> > the LED class device is unregistered.
> >
> > Manage the child node reference with a devm action registered before the
> > LED class device. This ensures that the LED class device is unregistered
> > before the child node reference is dropped, while also handling probe
> > failure and device removal.
> >
> > Fixes: cef8ec8cbd21 ("leds: add sgm3140 driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> > v2:
> >   - Keep the child node reference alive until the LED class device is
> >     unregistered, as pointed out by Laurent Pinchart.
> >   - Manage the reference with a devm action registered before the LED
> >     class device registration.
> >
> >  drivers/leds/flash/leds-sgm3140.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-sgm3140.c
> > index dc6840357370..973676b1dbb1 100644
> > --- a/drivers/leds/flash/leds-sgm3140.c
> > +++ b/drivers/leds/flash/leds-sgm3140.c
> > @@ -182,6 +182,11 @@ static void sgm3140_init_v4l2_flash_config(struct sgm3140 *priv,
> >  }
> >  #endif
> >
> > +static void sgm3140_fwnode_put(void *data)
> > +{
> > +     fwnode_handle_put(data);
> > +}
> > +
> >  static int sgm3140_probe(struct platform_device *pdev)
> >  {
> >       struct sgm3140 *priv;
> > @@ -220,6 +225,10 @@ static int sgm3140_probe(struct platform_device *pdev)
> >                       "No fwnode child node found for connected LED.\n");
> >               return -EINVAL;
> >       }
> > +     ret = devm_add_action_or_reset(&pdev->dev, sgm3140_fwnode_put,
> > +                                    child_node);
> > +     if (ret)
> > +             return ret;
> >
> >       ret = fwnode_property_read_u32(child_node, "flash-max-timeout-us",
> >                                      &priv->max_timeout);
> > @@ -276,7 +285,6 @@ static int sgm3140_probe(struct platform_device *pdev)
> >       return ret;
> >
> >  err:
> > -     fwnode_handle_put(child_node);
> >       return ret;
> >  }
> >
>
> --
> Regards,
>
> Laurent Pinchart

You're right. I sent v2 too quickly and failed to take your latest
comment on v1 into account. Sorry about that.

What led me to this issue was the documentation for
device_get_next_child_node(), which says the caller must call
fwnode_handle_put() on the returned fwnode. I focused too narrowly on
balancing that reference and missed the lifetime implications of passing
it to the LED core.

Would it make more sense for the LED core to take its own reference to
init_data->fwnode when associating it with the LED device, and keep that
reference for the lifetime of the LED class device? The driver could then
drop the temporary reference obtained from device_get_next_child_node()
after registration.

Does that sound like the right ownership model?

Thanks,
Guangshuo
