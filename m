From: Yves-Alexis Perez <corsac@corsac.net>
Subject: Re: [PATCH] firmware: fix async/manual firmware loading
Date: Thu, 10 Nov 2016 07:57:32 +0100
Message-ID: <1478761052.31531.1.camel@corsac.net>
References: <20161030145048.6291-1-corsac@corsac.net>
         <20161030145048.6291-2-corsac@corsac.net>
         <1477848538.3456.1.camel@corsac.net> <20161109203656.GG13978@wotan.suse.de>
         <20161109220210.GJ13978@wotan.suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha256";
        protocol="application/pgp-signature"; boundary="=-iDvmpXioHZZmWg0FUyXa"
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from smtp2-g21.free.fr ([212.27.42.2]:56648 "EHLO smtp2-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754087AbcKJG5q (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 10 Nov 2016 01:57:46 -0500
Received: from mail.corsac.net (unknown [78.194.244.226])
        by smtp2-g21.free.fr (Postfix) with ESMTPS id A2B3F20039E
        for <linux-leds@vger.kernel.org>; Thu, 10 Nov 2016 07:57:44 +0100 (CET)
Received: from scapa.corsac.net (unknown [IPv6:2a01:e34:ec2f:4e20:6af7:28ff:fe8d:2119])
        by mail.corsac.net (Postfix) with ESMTPS id 573BF89
        for <linux-leds@vger.kernel.org>; Thu, 10 Nov 2016 07:57:38 +0100 (CET)
In-Reply-To: <20161109220210.GJ13978@wotan.suse.de>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: "Luis R. Rodriguez" <mcgrof@kernel.org>, Matt Domsch <Matt_Domsch@dell.com>, Fengguang Wu <fengguang.wu@intel.com>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, Abhay Salunke <Abhay_Salunke@dell.com>, David Woodhouse <dwmw2@infradead.org>
Cc: linux-kernel@vger.kernel.org, Ming Lei <ming.lei@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johannes Berg <johannes@sipsolutions.net>, Jouni Malinen <j@w1.fi>, Kees Cook <keescook@chromium.org>, Jiri Kosina <jkosina@suse.cz>, Jiri Slaby <jslaby@suse.com>, Tom Gundersen <teg@jklm.no>, Kay Sievers <kay@vrfy.org>, Josh Boyer <jwboyer@fedoraproject.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Andy Lutomirski <luto@amacapital.net>, Harald Hoyer <harald@redhat.com>, Seth Forshee <seth.forshee@canonical.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Linus Torvalds <torvalds@linux-foundation.org>, Daniel Wagner <wagi@monom.org>, stable@vger.kernel.org


--=-iDvmpXioHZZmWg0FUyXa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2016-11-09 at 23:02 +0100, Luis R. Rodriguez wrote:
> Actually... we also set the timeout to MAX_JIFFY_OFFSET when FW_OPT_UEVEN=
T is
> not set. This happens *only* when the UMH was explicitly requested on the
> async call, when the second argument to request_firmware_nowait() is fals=
e.
> There are *only* two callers that do this in the kernel. If this is corre=
ct *and*
> the assessment of the cast from long to int here is correct that should m=
ean
> these two callers in the kernel that have always requested the UMH firmwa=
re
> *fallback* have *always* had a faulty UMH fallback return value...

Thanks for all your mails. Yes, that was my case here, and I noticed it loo=
ked
broken for a long time, I didn't investigate who was using it in the kernel
but I had the feeling it was a bit of an abuse of the infrastructure. I sti=
ll
reported the bug because the quick fix looked OK but I can understand the w=
ill
to actually rethink if and how this part is really needed.

Maybe I need to wait a bit before resubmitting any patch with rephrased com=
mit
log to see where this is going?

Regards,
--=20
Yves-Alexis
--=-iDvmpXioHZZmWg0FUyXa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJYJBpcAAoJEG3bU/KmdcClgOcH/31VeRfRLWyByQBPoETNsNXz
mn2qy35bu1fLe6gEbjRixsq0465j3fStUxlrzKXOGP8zusObMP5ptBDPwJvRWscC
E2zVBs9IYKvZ6H1ycZHEvvV2q5tWw32fWuOp4tYTeO6MLcu5L0XncgkklWQjrZnd
PSY9bRQxwW0pf7LDKRTFGW5KYY8NplhS5DG3T+fQqwdnuNSbmipSU/6OhMfiaB9I
qHysT7IFz2iC6MONYuzEmo0mquGpZ2E91dNBz2N77KxCeGiP/NI0dextxmcj3xFE
wZmVC/jgXMsfw036xmUxUCY9Qm6rpQwN8PMitl53xwB+03ZOlYskfVO7zPA5lA0=
=xDH1
-----END PGP SIGNATURE-----

--=-iDvmpXioHZZmWg0FUyXa--
