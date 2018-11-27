From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [ibm-acpi-devel] [PATCH 0/6] Introduce audio-mute
 LED trigger (and conversions to it)
Date: Tue, 27 Nov 2018 08:26:32 -0200
Message-ID: <20181127102632.qciftwcg3xodzhfv@khazad-dum.debian.net>
References: <20181126171126.20280-1-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
Content-Disposition: inline
In-Reply-To: <20181126171126.20280-1-tiwai@suse.de>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Takashi Iwai <tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Ayman Bagabas <ayman.bagabas@gmail.com>, platform-driver-x86@vger.kernel.org, Hui Wang <hui.wang@canonical.com>, ibm-acpi-devel@lists.sourceforge.net, Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

On Mon, 26 Nov 2018, Takashi Iwai wrote:
> this is patch series I've hacked after useful conversation with
> Pavel.  Basically this adds a new LED trigger audio-mute and
> audio-micmute, and convert the HD-audio driver and the platform
> drivers to use the LED trigger instead of the ugly direct dynamic
> symbol binding.

For the thinkpad-acpi bits, provided that Andy's comments are addressed:
Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

> I checked briefly on my Dell laptop, and a Thinkpad model.

Thanks :-)

-- 
  Henrique Holschuh
