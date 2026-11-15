Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780439;
	b=xcCD1TgRXiuNbosCMpO7BgVECnUBI2RYMAbzQUON/8DsMAxHgFdjFP3+a2zb0XAD3tqp
	 HiJ94KVdcsl0bgKlx9sUDinwqXsaftLjOuEnWOKZKIrXObtp6Al2Qg2hGqd9iduHHxrgs
	 pw2+kKL7fMLm0HQJplIW03nXltLfhgVxovJyDIY6KX+myBZNb2vT3vliUX8wCE8Gip6vj
	 w7QhFtiYSP/5UWiqFFYYve76T6ylUT27AwJ5fJhm5b6DanIRv+Ln++2Tdcba8QZZ1H6db
	 VCJSZWdajLM6C6yRwfyXcUIEoQ7vUdt4cEPUwNrqDESn6bSCIzEGoMqhu35AfWNmSmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780439;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=5W01Jex11VQtppQbL033Zph4yYpJZEMJCMwbW5eknkA=;
	b=rOV5iDuSkGTjhYzM+ZJhUvRGCr1KFqpn/1xibMZ+fdDJ+NyX5dj8QJqc7Y27MwdQXYk9
	 1yNWmWcONkrgLKBrxjj/EsOoj8W0uK90SF0uGO4/tz1EOgnjb2S8NYy9c3DqYXEt29DsG
	 XpGXHuztyjqWmu5SnHNP8hQ5YfCuf+OtjNonzq5EHHPiMaUOdouLJkAQpz1DM+3Ds0wP+
	 NoWUode/BTVVAFejL7KnvgYElkdCFeyb+84PTXrz2WmdgP69JFX+NSzblpoKgraWXn5No
	 tX2FumO2OUjzwKgCxNvys2e2WiTQReZD7OOogysDrpUtYW+urJ6WHeZ5qd8X8ILtj2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=squebb.ca;
	spf=pass smtp.mailfrom=squebb.ca;
	dkim=pass header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=mc88zSGs;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=05SdAPkl;
	arc=none smtp.remote-ip=202.12.124.150
Received: from fout-b7-smtp.messagingengine.com (fout-b7-smtp.messagingengine.com [202.12.124.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C610D606A329
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 22:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C610D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=squebb.ca header.i=@squebb.ca header.a=rsa-sha256 header.s=fm1 header.b=mc88zSGs;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=05SdAPkl
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfout.stl.internal (Postfix) with ESMTP id 1D5391D00109
	for <linux-leds@vger.kernel.org>; Sun, 15 Nov 2026 17:07:18 -0500 (EST)
Received: from stl-imap-02 ([10.204.2.93])
  by stl-compute-04.internal (MEProxy); Sun, 15 Nov 2026 17:07:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1794780437;
	 x=1794866837; bh=5W01Jex11VQtppQbL033Zph4yYpJZEMJCMwbW5eknkA=; b=
	mc88zSGs9nmztGJJ+zV6pW3mZZj3pGgxnjODpgPGzoHx8ldpQtVDSJwsAiQFVDII
	bKX5qxAcdkxXhjFt1Y0Qa3pD/sNbBLMK+a0waAUBNpcq4l3koASt0ilS/5jdNuLx
	6yAkJMjt4E+aEOs9e2GGplzBtTmS0NWLrl5lnMLyI8eOE6HsmWTtuqEwXbGr0etN
	WL1M0zqNuDjDTLUb/LSetENPh2yzG9v+lfHj3V8VVFTrYZJmlsPdtkc3u+zE6byi
	oRrMdRuFwbEohWFClpc9CQObomquZH0ZHZ32AaDXLLdU8m7uvPTyT/sp73G4kQti
	6cmTvI691brh3hDMcv/aGg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794780437; x=
	1794866837; bh=5W01Jex11VQtppQbL033Zph4yYpJZEMJCMwbW5eknkA=; b=0
	5SdAPklVZXNeazpTPqZntoIwgQWyptqVkNjHNTGnM0PS4cc3Y9NFuW75oya+y2as
	eWo2ybFGnW4X3R43XpWZ8koKIEBymYsuFzy44Fwy5vQg4Junov+jZwDQimp2Cje0
	x4rHSKWCmGyerfqJzWAcQY7wRCU0QZORknWfzrTxSwtPFvygM0g0ZuuJYlAV45K4
	M9WdbBURq5UWzROfw8rawivBC0Ha4Odnbdr96ihkfyrbs1ZdU6+gqwtjieGxZEyB
	7PwpcI9qnheJjHc8KuX+MbI2FKds16ICVJqt8LW5EiZDhoIE6rUOT6zfdhyJ35Mv
	Uy6XZRsNtXuFl055QqcVQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=squebb.ca a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794780437; d=squebb.ca;
	mf=PG1wZWFyc29uLWxlbm92b0BzcXVlYmIuY2E+;
	rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
	s=fm1:rsa-sha256:PrU5OHPH5IytlkajIn/bV7FsUIGkhyCzOcmZK/VS3++BV8C
	XIa5iNHAbU99HLQG2IfHm4+Ji5rxvkeiaMWBw5R4X6O0Ie23HvEsUTe2HH16x1bo
	gLn1QqGtfVmpd6DZZFtDaNrZ9UUl3Q1/4SX7x8WehpMFhPYidCBQMLbqDiJAUMy+
	aJOaGzl/EsC4P4YeCkFTrabkcT5w+uX+x42U+GCN/wAr7vTAdgYZLWHW7B3491xT
	1Q7NigWj20zAYi8bf8viDwZ0/xK3A3MbRm5fbb+4HVLvN2iQ83NsOtsclTXHglKQ
	bAdYtW/ItYp1OVe3EJE/F4GdGPYz77QXHwYDddQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:Pt0CFkdgPMlEc2VAsDgUwpz89PHbAVOPKiU8IbEFVGI=:ZSNZo0+hChThxLpKlQUJ174hlSoBCxsNplUkPEIpqMQ=;
X-ME-Sender: <xms:FC36amqvWr8xs5EjNvWu4Amw59oZMIDn5xacFAW6KUhUQqL4PePzdA>
    <xme:FC36ave_fHAKe0sLoH3OyOZJ-k3EV3gz-t4XSgLeztiHg6CgC4I9DlEvQoMh-eNDp
    ra6qmzv1nHZacof5BDuw1lHppAALq-Ys_RutbRHVviCCJGLj8wzQDbe>
X-ME-Proxy-Cause: dmFkZTEIQE6KcsOrNFJqF7WeLEWNoLGQ8ajl9vzMqe2ynHyuUugJ6xwqqdUT6/IVHtuD35
    XOdJ4TP+jciU9bPs5GBFqcFGEHmkTa8SJquEUiWk+ZJBsOJF7cY1LHxv5ic2XGlAGY7kCB
    /fmYpkFGvUjhHucbuTPqo0s1gjJutM8XF3UQLjLBGq62WcQNmiKrzXNrSwWIq6yoouYDUb
    yXef7ugmyeyfTa6fYXSOODlNMbsgTZ9b2D4nsPPM3sKgGVHZqu/M236IJtfxoUAKMLRVIe
    /wHMcMayIEn+I5p5zpe/7reNOyXawGo2AnuiXBVZNGq4Bhv+YB8WQKsUypHKrGPZQf7qlX
    eIiEYl46UtomK+fSvaj3skIW/LOVuye3/hGtTLb8ERoSUiDHb670n+fDJy1wkL5l+V53vi
    HtBhWJ2eZBMmUJMaenjXGz4T2oF7VmpjVAl1tIC3+Et1TEmsgZEX2LA34OwnXbU3QOj1Yw
    XfbIHlx3JFO9M2LFZO5waOT+UpsaIC2ppPTPSiPXFB/Ph8czsrpb1yS07+hiwKTQywMt5i
    pzq9n4wMcu3Pe9RX3H6Wmlh46bRBIDqKZ0vdXX9VycF+nDBcjdpF0UQQi6N+F/t4tgTmwc
    OYjJ3unITZ9q4Xvna0gBfgh5SYew1cDxqetWeKs6ApQp6M6i9jdThCsKmn3A
X-ME-Proxy: <xmx:FS36aspJPiosGkVEmwlZWkJEXCeTfpWB6L4EctTKfovAcBJX-k_oOA>
    <xmx:FS36au-witJWUAtvc4yeuTI_V_2f4wZnGuirIBrtLHnmpp87UKcfoA>
    <xmx:FS36ai2yTVh4wvxhTODHaCFyWCjGLWKSaj3SehDJVNRkGy0imd5lSA>
    <xmx:FS36ahAK6vfktcNan94528F3j30v6GMoNNpDlin5478daikwL45Igg>
    <xmx:FS36apov10NU0FCRQE8P2IuiuYZMGdZID9dl1VdifWqHLS_WHh8nJKok>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id BE50F2C00085; Sun, 15 Nov 2026 17:07:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AKLRvfems1kF
Date: Sun, 15 Nov 2026 17:06:56 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Qiling Zhu" <kmatzkaczor244@gmail.com>,
 "Derek J . Clark" <derekjohn.clark@gmail.com>, "Rong Zhang" <i@rong.moe>,
 "Hans de Goede" <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Henrique de Moraes Holschuh" <hmh@hmh.eng.br>
Cc: "Andrea Rabbaglietti" <rabbagliettiandrea@gmail.com>,
 "Lee Jones" <lee@kernel.org>, "Pavel Machek" <pavel@kernel.org>,
 "Griffin Kroah-Hartman" <griffin@kroah.com>,
 "Vishnu Sankar" <vishnuocv@gmail.com>, "Vishnu Sankar" <vsankar@lenovo.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 ibm-acpi-devel@lists.sourceforge.net, linux-leds@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <4fdab3d8-4ea5-40f4-bf91-9ce4caf028e3@app.fastmail.com>
In-Reply-To: <20261114174814.62153-5-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-5-kmatzkaczor244@gmail.com>
Subject: Re: [PATCH v3 4/7] platform/x86: thinkpad_acpi: Detect auto-mode capability
 via MLCG
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



On Sat, Nov 14, 2026, at 12:48 PM, Qiling Zhu wrote:
> The upper bits of the MLCG return value carry capability information.
> Bit 20 indicates whether the EC supports the auto mode of the keyboard
> backlight (0 = manual levels only, 1 = auto mode available), as defined
> by the firmware.
>
> Record it in tp_features.kbdlight_auto, in preparation for using it to
> gate the auto-mode trigger registration and the LED suspend/resume
> skipping in subsequent changes.
>
> Link: 
> https://lore.kernel.org/r/CABxCQKuEP5wMSstO0MK1MhaqXTKrPhUSN3V2mrE_42j4cXsXZQ@mail.gmail.com
> Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
> ---
>  drivers/platform/x86/lenovo/thinkpad_acpi.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c 
> b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> index 657a19d11..681b340a1 100644
> --- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
> +++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
> @@ -363,6 +363,7 @@ static struct {
>  		TP_HOTKEY_TABLET_USES_GMMS,
>  	} hotkey_tablet;
>  	u32 kbdlight:1;
> +	u32 kbdlight_auto:1;
>  	u32 light:1;
>  	u32 light_status:1;
>  	u32 bright_acpimode:1;
> @@ -5161,6 +5162,13 @@ static bool kbdlight_is_supported(void)
>  	}
> 
>  	vdbg_printk(TPACPI_DBG_INIT, "kbdlight MLCG returned 0x%x\n", status);
> +
> +	/*
> +	 * MLCG bit 20 indicates auto mode support: 0 = manual levels only,
> +	 * 1 = auto mode available (per the firmware definition).
> +	 */
> +	tp_features.kbdlight_auto = !!(status & BIT(20));
> +
>  	/*
>  	 * Guessed test for keyboard backlight:
>  	 *
> -- 
> 2.56.1

Looks good to me.
Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Mark
