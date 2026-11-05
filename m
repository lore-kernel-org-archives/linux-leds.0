Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884733;
	b=rSOqcfMBEs2srR6YsCXI7VO5N6yaxYw7a8q73xmAdhSfIW/d+UTVWnhvRFvj7d24Myic
	 SBOlW8H39DjpwtdHDSW5gGTPOYNIii0GQcNubyAs11DtxbwYlvmbOkE66rmFJCKkkUQ7/
	 +QaFME90VAdUAjSg85p/v5lZmQi0UbwYQToGSXQJ/BuGbNUwYWBXhX4C4QAPqySGhfr5V
	 IalA0rtdG84jTxq3tkObDHt4Esv1xRP20Yya6Gw/VFR+dTi+CHxoyFPbCpbuWzi4ejwlg
	 +DOxSbwLmq06MRvdh/+HYqK5yPf54iNI2VBxd/wXWR5PvvE2UEztuqcw0v2B4Ro7MMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WioThaDIkfDjWG1mFEw1+dKntzJ3B48ROFrYaw5ERg0=;
	b=2OO5vWaB4YUx9LXA4xIMAaJhOIqGPMHCr6d0rzHfLKZDOgADySZbLJn+WIgvQLbztl7N
	 dKF1QbmlsQUYxgl6xFpgJZ2eYP3Ban5DrigeeZMCy7UmssdwVgIeBlQXpdl3kuF6NhM97
	 cHNSyhavU9fYZDDc2GfcJZ4k1XrbYkKE1YtxP8DKWGFhjSgUX3NnLfoBdX3wgh5A5eIJQ
	 0JUUMkY7I5+hovGW/KrYXo1xJxyJGGGzqb2lnKIK4lCprCnJOGV0Frygf7FB98BaqnMUR
	 gLlF7+i7XRsggvt0pzlldYq0OvUSyvAWz6srezW6dE2hjnXLMRacJIUbfRcJ2df1TqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gVCCN+Gr;
	arc=none smtp.remote-ip=74.125.229.135
Received: from mail-dl2-f7.google.com (mail-dl2-f7.google.com [74.125.229.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D722F606A31B
	for <linux-leds@vger.kernel.org>; Thu,  5 Nov 2026 13:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D722F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gVCCN+Gr
Received: by mail-dl2-f7.google.com with SMTP id a92af1059eb24-139b659a45eso645220c88.1
        for <linux-leds@vger.kernel.org>; Thu, 05 Nov 2026 05:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793884727; x=1794489527; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WioThaDIkfDjWG1mFEw1+dKntzJ3B48ROFrYaw5ERg0=;
        b=gVCCN+Gr73v3MUVBJLbnhV1b+0LV98ng6EW/VUJDQGsV4q2ORJtsbS+lfrWX95WGId
         6FIiVlAf2bH/rqCwLCWWLVbgF7ZI1AbO1jKf++NOYwhzKHjRqkWj+UHZ3hheMXP0/evm
         kCI5gAMcbW4ytsWSdskwf1NpkDbOyZmGIobSWo5figyGBI4kH4ta0Su4JLeZ+8Pnf1iF
         XuAqVu0qxEMqO0SmRGY/JKGLTAZQWf+T/mOOnZcKUIbrmLaKqFffpbf605X6iPMy14BK
         PM9sfX4LLWDSok2QY+NkVQtcS3206z/r7Fjc8KH/TVXWNdjcCyJLbzdSj80dRlibhkiN
         yx0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884727; x=1794489527;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WioThaDIkfDjWG1mFEw1+dKntzJ3B48ROFrYaw5ERg0=;
        b=iLwSdywAcJvEyM5ytLVZxDywdJVRRrwNBGg42YNJsXoXOLR1aOYJiiBPPTyDW7oumZ
         LGBPKfS6pHt7R67YBkmWvNWKDb/NkYE72HTED0sP86Pv2SbMClokqGGPTNGha3mBYMjY
         J3WqMHFckM5JFzYzDondadoq5tw0GW7K7W1RWnV3slCsobxaGlSMKo+BrmZuiBkmeVpe
         /UQDGbAKcZvFwaC1eyABEuQZVWCdlqTsP9dJmKJtg/QOgdiCW0PVZO4xI75vFLdbVPfx
         X/FJHwdN3szfl3mMoJP77xKM91vonYxYHvor6VH6B/UlEuB4AbaeWPbCLZ7iMR7/mJLP
         ySlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrEiN8YAmcZb7XanF61rDp6KFUxFDjFGKpPrsrpfOXpld8zy/oSX4btwcwVu6fUZboO2RZsEgCPS4W@vger.kernel.org
X-Gm-Message-State: APuU4Z9uZNSOhv4uHWAogwXudxsIfsybRQ/m/Ho4t1Jr5eLMkQ1wP00p
	6yElwp5aghNrmM91ueVUT0Q/5NfOzfn7Yp5dQI0XuELsAd27Bmdvp16P
X-Gm-Gg: AYBFou1mijgTS5mv/7jGnrWl8EdPi66RXZhKru9hAiEvyHpHUMUzJdKDpXboabY4TQY
	YvSlc/FLeXaklh/Fi7ZKNUPsB1tGcAGXJfTqRe/YF0QK//FxA/rlSW2sq6npLqHlAh12apYmkUr
	I8QgOfY3qT60bMTLxKNK/gmc/pk9Iw5DKIhrsx3bHu+X9ZN4+HtOkwgBi1TVtCYkSyq+5oORThK
	YvjmAhcwYu+MrH/ezKlmQ/G69LaXYdXdprZM+8++HAr+ot2Vd7qny5EuBAOlyDQM5oLfTd2DaVV
	JJ6l91VNVsRvbsy8qMEy6HDp7koPqVsOapPfQ/Ga8TROqI+KQcp6xRpa4Lv/Z7jp6ME6W2VXBGK
	E+JeF1ELohW4YpKbasE1w+YlhyundooW52PNxc184vO7wO5RqxyzA8BXZFFrLBktwiMhfoEglqr
	eVyb8bUtmgX65bdT7Qw4V5ehm/HwSh+nEMDO0PQQk+IxPl0TD5pBQ5PLxsIjUtwhB8hx+zukaLp
	z+OEBmaQw1wtsk1qrqKPyjztjTwp2GMRGZ0l62mxRV9sPOTYO3vVMWgUyLqwOd38oKpClQRe/g0
	AsX7cdHn4mpx2cDOQ2LtOedUXC/sNVj5+Zz2q/p+K/Zog2f4
X-Received: by 2002:a05:7300:e9d3:20b0:369:fe81:a575 with SMTP id 5a478bee46e88-36a4243ab94mr33257991eec.35.1793884726829;
        Thu, 05 Nov 2026 05:18:46 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d3754sm22685561eec.14.2026.11.05.05.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:18:46 -0800 (PST)
Date: Thu, 5 Nov 2026 21:18:14 +0800
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Rong Zhang <i@rong.moe>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, 
	"Derek J. Clark" <derekjohn.clark@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
	Griffin Kroah-Hartman <griffin@kroah.com>, ibm-acpi-devel@lists.sourceforge.net, Lee Jones <lee@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, Pavel Machek <pavel@kernel.org>, 
	platform-driver-x86@vger.kernel.org, vishnuocv@gmail.com, vsankar@lenovo.com
Subject: Re: [RFC PATCH v2 0/2] Add support for auto keyboard backlight
Message-ID: <aux8zfwaupCb3wey@ThinkPad>
References: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
 <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <c1bfa5151bbe73977725305613842f94616a8dbb.camel@rong.moe>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1bfa5151bbe73977725305613842f94616a8dbb.camel@rong.moe>

On Tue, Nov 03, 2026 at 02:13:55AM +0800, Rong Zhang wrote:
> Hi Qiling,
> 
> On Mon, 2026-11-02 at 23:10 +0800, Qiling Zhu wrote:
> > Hi Mark, Rong, Ilpo,
> > 
> > Thanks for the review comments on v1. This v2 addresses them and is
> > now split into a pure refactor (1/2) and the feature addition (2/2),
> > as requested.
> 
> You don't need to refresh the series in a hurry, unless you've got enough
> reviews or may miss the cycle. Asking an LLM agent to refresh the series
> is easy, but a human being needs time to review your series.
> 
> Please leave some time for others to respond.

Thanks, Rong, for the detailed review. I'll rework the series
following your suggestions and take some time to understand and
test the changes carefully.

Thanks also for pointing out that I was updating the series
too quickly. I apologize for not leaving enough time for others
to review, and I appreciate your patience in explaining this.
I'll be more mindful of the review process going forward.

And thanks to Vishnu for clarifying the Auto-mode capability
detection. I'll use MLCG bit 20 to determine whether the
Auto trigger should be registered in the next revision.

I'm very open to further suggestions or alternative approaches.
If someone has a better implementation or existing patches that
would be a better fit, I'd be equally happy to build on those
instead. My main goal is to get this support implemented properly.

Thanks again for your time and help.

Regards,
Qiling Zhu
