From: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2] leds: Introduce userspace leds driver
Date: Thu, 15 Sep 2016 15:01:10 +0200
Message-ID: <20160915130110.GI13132@amd>
References: <1473361440-9668-1-git-send-email-david@lechnology.com>
 <84510542-4faa-9763-611a-be3890f3f1f7@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:59726 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S938994AbcIONBM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Sep 2016 09:01:12 -0400
Content-Disposition: inline
In-Reply-To: <84510542-4faa-9763-611a-be3890f3f1f7@samsung.com>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: David Lechner <david@lechnology.com>, Richard Purdie <rpurdie@rpsys.net>, linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>

Hi!

> >@@ -0,0 +1,23 @@
> >+/*
> >+ * Userspace driver support for leds subsystem
> >+ *
> >+ * This program is free software; you can redistribute it and/or modify
> >+ * it under the terms of the GNU General Public License as published by
> >+ * the Free Software Foundation; either version 2 of the License, or
> >+ * (at your option) any later version.
> >+ *
> >+ * This program is distributed in the hope that it will be useful,
> >+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
> >+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >+ * GNU General Public License for more details.
> >+ */
> >+#ifndef _UAPI__ULEDS_H_
> >+#define _UAPI__ULEDS_H_
> >+
> >+#define ULEDS_MAX_NAME_SIZE	80
> >+
> >+struct uleds_user_dev {
> >+	char name[ULEDS_MAX_NAME_SIZE];
> >+};

We already have path component length limit somewhere, right? Just use
it?

(And is struct with char array good idea at all? Perphaps it can just
use write() length up to something reasonable, and not bother with new
header file for userspace?)

									Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
