Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312161;
	b=AzRlnR9Wx+G4WP5LgKgLSDnhuPF0l+QB5fTldR97eE0w6DeutqK97ZotefBQ4Zu0TfEx
	 aqoq7L8XWXGZm90oNIV+rjuDTw5DnxRVXAszoYiFIUIgL0It09bIt4iI7R8iOPTro/7QN
	 ovmN37YdcnNsFEc+P+uJD7m0r6GT9zVvCjkDH/aguOVy0GZbPuKMihylPGzPu+Y7uUz6N
	 2SUk9bBW8L3FnJREH6o3AtyVHMS45/PRckBtl+y3og/azEAFzswKs+o4dUezNHlM83Z1D
	 rNy0/T6D/YZMBggV831YnJBKt9kYyuErwjyURw/8WeSEkPRGr688GP/2W9eBnzKYXvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312161;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=SH/FoN6uZbvhXWx+mjNqxG+5UNI9GCQnZ6S37gnELZA=;
	b=fBwTqWAwvVLPfMMTc+2PDh+orDURJcBgvoXun4RhsnBltlvIvhai1e8+Kvd8LSK5bM4n
	 OHv1JngOZRINR0ovhVybyEv1W3Td4DWWCga/QrIrbCI/dGpFrhwNXBimL0T5m9l/H7IGK
	 VInh6A7W8iofLOy4C3S5Xq1OcV7pz3u1G8DyqCi+9Q596qzFuU15X0skg+HEM7sEU2/TV
	 DRW4R5G0Js25aTUDh4E8deif3hjU5MUFEm1mIKae2t+jf1uTVhRV/2PCoSrJOwCI3/S/i
	 P6XOUlhv5l5plrkp8UMJn7sAL5p7QJBUi+YZb5j6M9R7+XmLAadPCSk0i8S+vGQ0GVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kUZTMrNx;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB425606A31C;
	Tue, 10 Nov 2026 12:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB425606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kUZTMrNx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794312161; x=1825848161;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=eMdM21hEmkcP8lpu6VNP1r22o5MSqJ/EL0i7jh9A8CU=;
  b=kUZTMrNxJtILykmCCaIXMcwKq3QkLvaW0LIpMR1fXQY62mFaTQGHT5QD
   rDBW0hlZwjAiw0z7w6xzqxUTfQzf/9a/oE23kojFP5LmugEEEp+1usTTd
   kWe/Fb8xxlcsycjuEuBX8ZUMCWAcs1AkWOz82LahPdJkDHM0KBJ+mTGp1
   kRYGV3H5qih5Crm/2YekOVHlwVrJSxhnIiEnxH1UGPO5SgB4vBMwg1h8x
   8O7efVfrBV71obIM0mkE/FfS/Czz2Ygjj/6ds0he6rwuwvAbn410mCmEx
   oMNuHk2pdC8+dLZJZIUk4cKFBQDxnfekP9JtTJ+in/eiaKsQ/VSN3XV79
   Q==;
X-CSE-ConnectionGUID: eVnBbn3bRc+y8uyAB+YlEA==
X-CSE-MsgGUID: XhuOpTUeTUWURYnlL8hycA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3138909"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3138909"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 04:02:40 -0800
X-CSE-ConnectionGUID: xGdkc45iT5eGhiHxJBsghA==
X-CSE-MsgGUID: 6/P5oL78RfKEQtOZQyxoMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8459686"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.34])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 04:02:32 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 10 Nov 2026 14:02:28 +0200 (EET)
To: Lee Jones <lee@kernel.org>
cc: Pavel Machek <pavel@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
    Shuah Khan <skhan@linuxfoundation.org>, 
    =?ISO-8859-15?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>, 
    Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
    =?ISO-8859-15?Q?Marek_Beh=FAn?= <kabel@kernel.org>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Derek J. Clark" <derekjohn.clark@gmail.com>, 
    Hans de Goede <hansg@kernel.org>, Ike Panhc <ikepanhc@gmail.com>, 
    Rong Zhang <i@rong.moe>, Andrew Lunn <andrew+netdev@lunn.ch>, 
    Jakub Kicinski <kuba@kernel.org>, Vishnu Sankar <vishnuocv@gmail.com>, 
    Vishnu Sankar <vsankar@lenovo.com>, linux-leds@vger.kernel.org, 
    Netdev <netdev@vger.kernel.org>, linux-doc@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, chrome-platform@lists.linux.dev, 
    platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v7 00/13] leds: Add support for hardware-initiated hardware
 control trigger transition
In-Reply-To: <20261110090105.GA6323@joneslee-macbookpro.roam.internal>
Message-ID: <b19ef65f-c563-07f8-1be8-9a0a0689da22@linux.intel.com>
References: <20260921-leds-trigger-hw-changed-v7-0-fe3cdb6dec51@rong.moe> <179425319974.10927.7190572777719580956.b4-ty@b4> <20261110090105.GA6323@joneslee-macbookpro.roam.internal>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1170544091-1794312148=:1229"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1170544091-1794312148=:1229
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 10 Nov 2026, Lee Jones wrote:

> On Mon, 09 Nov 2026, Ilpo J=E4rvinen wrote:
>=20
> > On Mon, 21 Sep 2026 03:40:14 +0800, Rong Zhang wrote:
> >=20
> > > Some laptops can tune their keyboard backlight according to ambient
> > > light sensors (auto mode). This capability is essentially a hardware
> > > control trigger. Meanwhile, such laptops also offer a shrotcut for
> > > cycling through brightness levels and auto mode. For example, on
> > > ThinkBook, pressing Fn+Space ("shortcut") cycles keyboard backlight
> > > levels in the following sequence:
> > >=20
> > > [...]
> >=20
> > Thank you for your contribution, it has been applied to my local
> > review-ilpo-next branch. Note it will show up in the public
> > platform-drivers-x86/review-ilpo-next branch only once I've pushed my
> > local branch there, which might take a while.
> >=20
> > FYI [if applicable to your patch], as per Linus' policy change, also
> > fixes are mostly routed through for-next unless the fix is for a
> > commit introduced in the most recent cycle or is clearly a regression
> > fix.
> >=20
> > The list of commits applied:
> > [01/13] leds: class: Always protect brightness_show() with led_access
> >         (no commit info)
> > [02/13] leds: trigger: Move led_trigger_is_hw_controlled() to the right=
 place
> >         (no commit info)
> > [03/13] leds: class: Remove hardware control trigger when writing brigh=
tness
> >         (no commit info)
> > [04/13] leds: trigger: Move led_trigger_group to the right place
> >         (no commit info)
> > [05/13] leds: trigger: Add hw_offloaded() callback and provide trigger_=
may_offload_to_hw attribute
> >         (no commit info)
> > [06/13] leds: cros_ec: Implement hw_offloaded() trigger callback
> >         (no commit info)
> > [07/13] leds: turris-omnia: Implement hw_offloaded() trigger callback a=
nd declare hw_control_trigger
> >         (no commit info)
> > [08/13] leds: trigger: netdev: Implement hw_offloaded() callback
> >         (no commit info)
> > [09/13] leds: trigger: Enforce strict checks in led_trigger_is_hw_contr=
olled()
> >         (no commit info)
> > [10/13] leds: trigger: Add led_trigger_notify_hw_control_changed() inte=
rface
> >         (no commit info)
>=20
> This is super confusing!

I know it is but it's how b4 thankyou mails appear.

> Where does this list come from?

The list comes from the original series that b4 caches somewhere.
I deleted the patches 1-10 and only applied mbox that contained patches=20
11-13.

When constructing thankyou mail, b4 seems to take the cached list of=20
patches the series had and does not find 1-10 applied into my tree by me=20
so it says (no commit info). The rest appear as expected:

> > [11/13] platform/x86: ideapad-laptop: Serialize keyboard backlight trac=
king
> >         commit: d288a6f989b7b9e6a730140c601987b886af327e
> > [12/13] platform/x86: ideapad-laptop: Decouple hardware & classdev brig=
htness for keyboard backlight
> >         commit: 7d6c073d181d7855561831cb4bba17dc9b7d4aa9
> > [13/13] platform/x86: ideapad-laptop: Fully support auto keyboard backl=
ight
> >         commit: 5d805ca01382d63d54c9984e7f19922c4ae6f3dc

Of course it would be much less confusing if it never showed those no=20
commit info entries at all but unfortunately I don't think I can control=20
that, sorry.

--=20
 i.

--8323328-1170544091-1794312148=:1229--
