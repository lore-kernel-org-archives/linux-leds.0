Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AEF15487;
	Mon, 27 Nov 2023 09:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="si1uXyfY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F70DC433C7;
	Mon, 27 Nov 2023 09:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1701077657;
	bh=rWdOk5F1xy/hz6UlHbgz3bUdswLVZyPhPBL8yovT9pY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=si1uXyfYv3uMujQHrz3CQOSOZPn1oWFYlltWK9eIGXQRJvMVq8/ZFwcUS7Q74w59M
	 UpFUTeK8t3upgJm5dwu+FN9S2Vtk9PxXdKq8veQnt84Butxd7v1ML7Egp+cso7m0Bf
	 Ani7Smdw5O8nzejEeJPz1OlNSFsQjylLBWC5+B00=
Date: Mon, 27 Nov 2023 09:34:15 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Florian Eckert <fe@dev.tdt.de>
Cc: Eckert.Florian@googlemail.com, pavel@ucw.cz, lee@kernel.org,
	kabel@kernel.org, linux-leds@vger.kernel.org,
	stable@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [Patch v3 1/1] leds: ledtrig-tty: free allocated ttyname buffer
 on deactivate
Message-ID: <2023112718-profane-dipped-a9a8@gregkh>
References: <20231127081621.774866-1-fe@dev.tdt.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127081621.774866-1-fe@dev.tdt.de>

On Mon, Nov 27, 2023 at 09:16:21AM +0100, Florian Eckert wrote:
> The ttyname buffer for the ledtrig_tty_data struct is allocated in the
> sysfs ttyname_store() function. This buffer must be released on trigger
> deactivation. This was missing and is thus a memory leak.
> 
> While we are at it, the tty handler in the ledtrig_tty_data struct should
> also be returned in case of the trigger deactivation call.
> 
> Cc: stable@vger.kernel.org
> Fixes: fd4a641ac88f ("leds: trigger: implement a tty trigger")
> Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> Reviewed-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
